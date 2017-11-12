require "spec_helper"

RSpec.describe Pigeon::SingletonClient do
  it "is a singleton" do
    client1 = Pigeon::SingletonClient.instance
    client2 = Pigeon::SingletonClient.instance
    expect(client1.object_id).to eq(client2.object_id)
  end

  it "can set and return a pubsub client" do
    pubsub = "pubsub"
    client = Pigeon::SingletonClient.instance
    client.set_pubsub(pubsub)
    expect(client.pubsub).to eq(pubsub)
  end
end
