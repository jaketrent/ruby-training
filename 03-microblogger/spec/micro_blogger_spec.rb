require "spec_helper"
require "micro_blogger"

describe MicroBlogger do
  
  # or use stub()
  let(:fake_client) { stub("Fake Twitter Client") }

  let(:blogger) do
    blogger = MicroBlogger.new
    blogger.stub(:client).and_return fake_client
    blogger
  end

  describe "#initialize" do

    it "should have a client" do
      blogger = MicroBlogger.new
      expect(blogger).to respond_to :client
      expect(blogger.client).to be_kind_of Twitter::Client
    end

  end

  describe "#tweet" do

    it "can tweet with abandon" do
      msg = "message to tweet"
      fake_client.should_receive(:update).with(msg)
      blogger.tweet msg
    end

    it "will not allow tweets over 140 characters" do
      msg = "message that's too long".ljust(141, "*")
      fake_client.should_not_receive(:update).with(msg)
      blogger.tweet msg
    end

  end

  describe "#process_command" do

    it "should send tweets" do
      fake_client.should_receive(:update).with("My message")
      blogger.process_command("tweet My message")
    end

    it "should ignore random commands" do
      fake_client.should_not_receive(:update).with("My message")
      blogger.process_command "bluebird My message"
    end

  end

end