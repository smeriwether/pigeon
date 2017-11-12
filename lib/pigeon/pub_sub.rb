require "singleton"

module Pigeon
  class PubSub
    include Singleton

    def initialize
      @subscribers = []
    end

    def configure!
      pubsub = Pigeon::SingletonClient.instance.pubsub
      collector = Pigeon::Job::Collector.instance
      collector.topic_names.each do |topic_name|
        subscription_name, job = collector.topic_data(topic_name)
        topic = pubsub.topic(topic_name)
        topic = pubsub.create_topic(topic_name) if topic.nil? || !topic.exists?
        subscription = topic.subscription(subscription_name)
        subscription = topic.subscribe(subscription_name) if subscription.nil? || !subscription.exists?
        subscriber = subscription.listen do |message|
          message.acknowledge!
          job.perform_now(message.data) if message
        end
        subscriber.start
        @subscribers << subscriber
      end
    end

    def destroy!
      @subscribers.each { |subscriber| subscriber.stop.wait! }
    end
  end
end
