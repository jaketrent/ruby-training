require "spec_helper"
require "personal_chef"

# describe
# it
# expect
#

describe PersonalChef do

  # let(:chef) do
  #   PersonalChef.new
  # end

  before(:each) do
    @chef = PersonalChef.new 
  end

  it "should have a default toast style" do
    expect(@chef.default_toast_style).to eq "sourdough"
  end

  describe "#make_milkshake" do
    
    it "should be chainable" do
      expect(@chef.make_milkshake).to eq @chef
    end

    it "should make a milkshake" do
      @chef.should_receive(:puts).with "Making your thick milkshake"
      @chef.make_milkshake
    end

  end

  describe "#make_toast" do

    it "should be chainable" do
      expect(@chef.make_toast).to eq @chef
    end

    it "should make toast" do
      @chef.should_receive(:puts).with "Making your sourdough toast!"
      @chef.make_toast
    end

  end

end
