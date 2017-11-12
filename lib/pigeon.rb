require "active_support/inflector"
require "active_support"

require "pigeon/version"

require "pigeon/process"
require "pigeon/singleton_client"
require "pigeon/pub_sub"

require "pigeon/job/collector"
require "pigeon/job/job"

require "pigeon/railtie" if defined?(Rails)

module Pigeon
  def self.configure(pubsub:)
    client = Pigeon::SingletonClient.instance
    client.set_pubsub(pubsub)
    client
  end
end
