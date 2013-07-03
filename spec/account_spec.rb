require 'account'

describe Account do
  it "can be created" do
    Account.create("ComCast", "2003003949")

    a = Account.find_by_name('ComCast')
    a.should_not be_nil
    a.name.should == 'ComCast'
    a.account_number.should == '2003003949'
  end

  it "has many bills" do
    # account.bills.should be_empty 
    # account.add_bill('2013-07-01', 29.52)
    # account.bills.should_not be_empty
  end
end
