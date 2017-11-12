class FakeJob
  include Pigeon::Job

  topic :fake_topic
  subscription :fake_topic_subscription
end
