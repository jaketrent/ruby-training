require "spec_helper"
require "Butler"

describe Butler do 

  let(:butler) do
    Butler.new
  end
  
  describe "#open_door" do

    it "should default to the front door" do
      butler.should_receive(:puts).with "Opening the front door"
      butler.open_door
    end

    it "should open specified doors" do
      butler.should_receive(:puts).with "Opening the closet door"
      butler.open_door "closet"
    end

    describe "private doors" do

      it "should not open the bathroom doom" do
        butler.should_receive(:puts).with "I'm sorry.  I cannot open that door"
        butler.open_door "bathroom"
      end

      it "should not open the bedroom doom" do
        butler.should_receive(:puts).with "I'm sorry.  I cannot open that door"
        butler.open_door "bedroom"
      end

    end

  end

end