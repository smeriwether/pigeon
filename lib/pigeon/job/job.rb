require "active_support/concern"

module Pigeon
  module Job
    extend ActiveSupport::Concern

    class_methods do
      def topic(topic)
        Pigeon::Job::Collector.instance.set_topic(topic, name)
      end

      def subscription(sub)
        Pigeon::Job::Collector.instance.set_subscription(sub, name)
      end
    end
  end
end
