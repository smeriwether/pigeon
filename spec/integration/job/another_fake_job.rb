class AnotherFakeJob
  include Pigeon::Job

  topic :another_fake_topic
  subscription :another_fake_topic_subscription
end
