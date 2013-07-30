module Money
  class Account
    attr_accessor :id, :name, :account_number, :recurring, :bills

    def initialize name, number, recurring=false
      @name = name
      @account_number = number
      @recurring = recurring
      @bills = []
    end

    def self.create  name, account_number
      a = Account.new(name, account_number)
      a.persist!
      a.id = db.execute("select last_insert_rowid()")
      a
    end

    def self.find_by_name name
      db.execute("select * from Accounts where name='#{name}'") do |row|
        return Account.new(row[1], row[2], row[3].to_i > 0)
      end
    end


    def add_bill due_date, amount
      @bills << Bill.new(due_date, amount)
      @bills[0].persist!
      @bills
    end

    def persist!
      # TODO - Extract into "migration" ??
      db.execute "CREATE TABLE IF NOT EXISTS Accounts(id INTEGER PRIMARY KEY, 
    name, account_number, recurring)"
    db.execute "INSERT INTO Accounts Values(NULL, ?, ?, ?)", @name, @account_number, @recurring ? 1 : 0
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
