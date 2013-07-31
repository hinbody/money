require 'spec_helper'

module Money
  describe Account do
    let(:account) { Account.create("ComCast", "2003003949") }
    let(:account2) { Account.create("Att", "234567") }
    it "can be created" do
      #Account.create("Att", "234567")
      #Account.create("ComCast", "2003003949")
      account
      account2

      a = Account.find_by_name('ComCast')
      a.should_not be_nil
      a.name.should == 'ComCast'
      a.name.should_not == 'Att'
      a.account_number.should == '2003003949'
    end

    context "bills" do
      it "has many bills" do
        a = Account.find_by_name('ComCast')
        a.bills.should be_empty 
        a.add_bill('2013-07-01', 29.52, a.id)
        a.bills.should_not be_empty
      end

      it "can get the first bill" do
        a = Account.find_by_name('ComCast')
        a.add_bill("2013-07-01", 29.52, a.id)
        a.bills.first.should be_a Bill
      end
    end
  end
end
