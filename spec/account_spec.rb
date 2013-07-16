require 'account'

describe Account do
  let(:account) { Account.create("ComCast", "2003003949") }
  it "can be created" do
    Account.create("Att", "234567")
    Account.create("ComCast", "2003003949")

    a = Account.find_by_name('ComCast')
    a.should_not be_nil
    a.name.should == 'ComCast'
    a.name.should_not == 'Att'
    a.account_number.should == '2003003949'
  end

  context "bills" do
    it "has many bills" do
      account.bills.should be_empty 
      account.add_bill('2013-07-01', 29.52)
      account.bills.should_not be_empty
    end

    it "can get the first bill" do
      account.add_bill("2013-07-01", 29.52)
      account.bills.first.should be_a Bill
    end
  end
end
