require "money"

describe Money do
  it "can create a new account" do
    @account = Account.new "name", "number"
  end
end
