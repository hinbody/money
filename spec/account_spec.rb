require 'account'

describe Account do
  let(:account) { Account.create("ComCast", "2003003949") }
  it "can be created" do
    Account.create("ComCast", "2003003949")

    a = Account.find_by_name('ComCast')
    a.should_not be_nil
    a.name.should == 'ComCast'
    a.account_number.should == '2003003949'
  end

  it "can find all recurring bills" do
    Account.create("Att", "234567", true)
    Account.create("ComCast", "2003003949")
    r_a = Account.find_recurring
    r_a.should_not be_nil
    r_a.name.should == 'Att'
    r_a.account_number.should == '234567'
    r_a.name.should_not == 'ComCast'
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
