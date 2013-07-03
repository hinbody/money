require 'account'

describe Account do
  before do
    @account = Account.new "name", "number"
  end
  it "can update name of account" do
    @account.update_name "new_name"
    @account.name.should eql "new_name"
  end
  it "can update number of account" do
    @account.update_account_number "new_number"
    @account.account_number.should eql "new_number"
  end
end
