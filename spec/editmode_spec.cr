require "./spec_helper"

describe Editmode do
  it "sets api_key" do
    Editmode.api_key = "test"
    Editmode.api_key.should eq("test")
  end

  it "gets client" do
    Editmode.client.class.name.should eq("HTTP::Client")
  end
end
