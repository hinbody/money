require 'spec_helper'

module Money
  describe Bill do
    let(:b) {  Bill.new("2013-07-01", 29.52, "1") }
    it "can be created" do
      b.should be_a Bill
    end
  end
end
