require 'spec_helper'

module Money
  describe Bill do
    it "can be created" do
      b = Bill.new("2013-07-01", 29.52)
      b.should be_a Bill
    end
  end
end
