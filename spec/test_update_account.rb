require 'account'

describe Account do
  before do
    @account = Account.new "name", "number", "due", "date", "last_pmt",
      "last_amount"
  end
  it "can update name of account" do
    @account.update_name "new_name"
    @account.name.should eql "new_name"
  end
  it "can update number of account" do
    @account.update_account_number "new_number"
    @account.account_number.should eql "new_number"
  end
  it "can update the current amount due" do
    @account.update_current_due "new_amount"
    @account.current_due.should eql "new_amount"
  end
  it "can update the current date due" do
    @account.update_due_date "new_date"
    @account.due_date.should eql "new_date"
  end
  it "can update the last payment date" do
    @account.update_last_payment_date "new_paid_date"
    @account.last_payment_date.should eql "new_paid_date"
  end
  it "can update the last payment amount" do
    @account.update_last_payment_amount "new_paid_amount"
    @account.last_payment_amount.should eql "new_paid_amount"
  end
end
