require "singleton"

module Pigeon
  module Job
    class Collector
      include Singleton

      def initialize
        @topics = []
        @job_topics = {}
        @data = {}
      end

      def topic_names
        @topics
      end

      def topic_data(topic_name)
        @data[topic_name]
      end

      def set_topic(topic_name, job_name)
        @topics << topic_name
        @job_topics[job_name] = topic_name
      end

      def set_subscription(sub_name, job_name)
        topic_name = @job_topics[job_name]
        @data[topic_name] = [sub_name, job_name.classify.constantize]
      end
    end
  end
end
