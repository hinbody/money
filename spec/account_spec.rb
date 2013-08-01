require 'spec_helper'

module Money
  describe Account do

    before(:all) do 
      Account.create("Att", "234567", "www.example.com", "staff@example.com",
                    "574-522-5222", true)
      Account.create("ComCast", "2003003949")
    end

    #seems like we should have a spec for testing the find_by_name method? but
    #the following block does that
    before(:all) do
      @a = Account.find_by_name('ComCast')
    end

    it "can be created" do
      @a.should_not be_nil
      @a.name.should == 'ComCast'
      @a.name.should_not == 'Att'
      @a.account_number.should == '2003003949'
    end

    it "can find account by account_number" do
      @account = Account.find_by_account_number('234567')
      @account.name.should == 'Att'
      @account.name.should_not == 'ComCast'
    end

    it "can find website by account name" do
      @account = Account.find_website_by_account_name('Att')
      @account.website.should_not be_nil
      @account.website.should == 'www.example.com'
    end

    context "bills" do
      it "can add a bill" do
        @a.bills.should be_empty 
        @a.add_bill('2013-07-01', 29.52, @a.id)
        @a.bills.should_not be_empty
      end

      it "has many bills" do
        #need code here? spec above and below both add a bill to the same
        #account. Proves an account can have many bills?
      end

      it "can get the first bill" do
        @a.add_bill("2013-08-01", 29.52, @a.id)
        @a.bills.first.should be_a Bill
      end
    end
  end
end
