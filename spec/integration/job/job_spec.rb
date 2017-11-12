require "spec_helper"

RSpec.describe "Job Integration" do
  it "correctly loads job data into JobSingleton" do
    require_relative "fake_job.rb"
    require_relative "another_fake_job.rb"

    singleton = Pigeon::Job::Collector.instance

    topic_names = singleton.topic_names
    expect(topic_names).to eq(%i[fake_topic another_fake_topic])

    topic_data = singleton.topic_data(:fake_topic)
    expect(topic_data).to eq([:fake_topic_subscription, FakeJob])

    topic_data = singleton.topic_data(:another_fake_topic)
    expect(topic_data).to eq([:another_fake_topic_subscription, AnotherFakeJob])
  end
end
