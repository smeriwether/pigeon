RSpec.describe Pigeon do
  it "has a version number" do
    expect(Pigeon::VERSION).not_to be nil
  end

  it "can be configured" do
    pubsub = "pubsub"
    client = Pigeon.configure(pubsub: pubsub)
    expect(client.pubsub).to eq(pubsub)
  end
end
