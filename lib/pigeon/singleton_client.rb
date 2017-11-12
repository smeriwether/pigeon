require "singleton"

module Pigeon
  class SingletonClient
    include Singleton

    def initialize
      @pubsub = nil
    end

    def pubsub
      @pubsub
    end

    def set_pubsub(pubsub)
      @pubsub = pubsub
    end
  end
end
