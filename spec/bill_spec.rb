require 'spec_helper'

module Money
  describe Bill do
    let(:b) {  Bill.new("2013-07-01", 29.52, "1") }
    #let(:account) { Account.create("CableCo", "2003003949") }
    it "can be created" do
      b.should be_a Bill
    end
    it "can get total of all bills" do
      @account = Account.create("CableCo", "2003003949")
      Bill.drop_bill_table 
      @account.add_bill('2013-07-01', 29.52, @account.id)
      @account.add_bill('2013-08-01', 29.52, @account.id)
      Bill.total_of_all_bills.should == 59.04
    end
  end
end
