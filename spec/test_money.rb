require "money"

describe Money do
  it "can create a new account" do
    @account = Account.new "name", "number", "due", "date", "last_amount",
      "last_date"
  end
end
