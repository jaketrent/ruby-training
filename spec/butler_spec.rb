require "spec_helper"
require "Butler"

describe Butler do 

  let(:butler) do
    Butler.new
  end
  
  describe "#open_door" do

    it "should default to the front door" do
      butler.should_receive(:puts).with "Opening the front door, sir."
      butler.open_door
    end

    it "should open specified doors" do
      butler.should_receive(:puts).with "Opening the closet door, sir."
      butler.open_door "closet"
    end

    it "should open more specified doors" do
      butler.should_receive(:puts).with "Opening the laundry door, sir."
      butler.open_door "laundry"
    end

    describe "kindness level" do

      it "should reply with 'sir'" do
        butler.should_receive(:puts).with /sir/
        butler.open_door
      end

    end

    describe "private doors" do

      it "should not open the bathroom door" do
        butler.should_receive(:puts).with "I'm sorry.  I cannot open that door, sir."
        butler.open_door "bathroom"
      end

      it "should not open the bedroom door" do
        butler.should_receive(:puts).with "I'm sorry.  I cannot open that door, sir."
        butler.open_door "bedroom"
      end

      it "should not open the safe door" do
        butler.should_receive(:puts).with "I'm sorry.  I cannot open that door, sir."
        butler.open_door "safe"
      end

    end

  end

end