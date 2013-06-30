require 'account'
describe Account do
  before :each do
    @account = Account.new "Name", "account_number", "current_due", "due_date",
      "last_payment_date", "last_payment_amount"
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
  describe "#current_due" do
    it "returns the current amount due for account" do
      @account.current_due.should eql "current_due"
    end
  end
  describe "#due_date" do
    it "returns the current date due for current_due" do
      @account.due_date.should eql "due_date"
    end
  end
  describe "#last_payment_date" do
    it "returns the date of last payment made" do
      @account.last_payment_date.should eql "last_payment_date"
    end
  end
  describe "#last_payment_amount" do
    it "returns the amount of last payment made" do
      @account.last_payment_amount.should eql "last_payment_amount"
    end
  end
end
