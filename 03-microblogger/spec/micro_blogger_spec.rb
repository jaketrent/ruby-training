require "spec_helper"
require "micro_blogger"

describe MicroBlogger do
  
  # use either mock() or stub()
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
      fake_client.should_receive(:update).with msg
      blogger.tweet msg
    end

    it "will not allow tweets over 140 characters" do
      msg = "message that's too long".ljust(141, "*")
      fake_client.should_not_receive(:update).with anything
      blogger.tweet msg
    end

    describe "url shortening" do
      it "will shorten a single url in tweets" do
        msg = "message that contains this url: http://jaketrent.com"
        fake_client.should_receive(:update).with /bit\.ly/
        fake_client.should_not_receive(:update).with /jaketrent\.com/
        blogger. tweet msg
      end

      it "will a multiple same url in tweets" do
        msg = "message that contains this url: http://jaketrent.com and again http://jaketrent.com here"
        fake_client.should_receive(:update).with /bit\.ly/
        fake_client.should_not_receive(:update).with /jaketrent\.com/
        blogger. tweet msg
      end

      it "will a multiple different urls in tweets" do
        msg = "message that contains this url: http://jaketrent.com and again http://rockycode.com here"
        fake_client.should_receive(:update).with /bit\.ly/
        fake_client.should_not_receive(:update).with /jaketrent\.com/
        fake_client.should_not_receive(:update).with /rockycode\.com/
        blogger. tweet msg
      end
    end

  end

  describe "#dm" do

    it "should send a dm" do
      fake_client.should_receive(:update).with "d username message"
      blogger.dm "username", "message"
    end

    it "should not allow dms over 140 chars" do
      msg = "message that's too long".ljust(141, "*")
      fake_client.should_not_receive(:update).with anything
      blogger.dm "username", msg
    end

  end

  describe "#process_command" do

    it "should call tweet cmd" do
      blogger.should_receive(:tweet).with("My message")
      blogger.process_command("tweet My message")
    end

    it "should call dm cmd" do
      blogger.should_receive(:dm).with "username", "here's a dm for you"
      blogger.process_command "dm username here's a dm for you"
    end

    it "should ignore random commands" do
      fake_client.should_not_receive(:update).with("My message")
      blogger.process_command "bluebird My message"
    end

  end

end