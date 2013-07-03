require 'account'
describe Account do
  before :each do
    @account = Account.new "Name", "account_number"
  end
  describe "#new" do
    it "creates a new account with proper attributes" do
      @account.should be_an_instance_of Account
    end
  end
  describe "#name" do
    it "returns the correct name of account" do
      @account.name.should eql "Name"
    end
  end
  describe "#account_number" do
    it "returns the correct number for account" do
      @account.account_number.should eql "account_number"
    end
  end
end
