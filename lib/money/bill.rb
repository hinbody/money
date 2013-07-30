module Money
  class Bill
    attr_accessor :due_date, :amount, :account_id

    def initialize(due_date, amount, account_id)
      @due_date = due_date
      @amount = amount
      @account_id = account_id
    end

    def persist!
      db.execute "CREATE TABLE IF NOT EXISTS Bills(id INTEGER PRIMARY KEY,
      due_date, amount, account_id)"
      db.execute "INSERT INTO Bills Values(NULL, ?, ?, ?)", @due_date, @amount, @account_id
    rescue SQLite3::Exception => e
      puts "Exception occured"
      puts e
    end

    private

    def self.db
      DataStore.instance
    end

    def db
      self.class.db
    end
  end
end
