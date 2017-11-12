require "spec_helper"

RSpec.describe Pigeon::PubSub do
  it "is a singleton object" do
    client1 = Pigeon::PubSub.instance
    client2 = Pigeon::PubSub.instance
    expect(client1.object_id).to eq(client2.object_id)
  end
end
