module Money
  class Account
    attr_accessor :id, :name, :account_number, :website, :email, :phone,
                  :recurring, :bills

    def initialize(name, number, website = '', email = '', phone = '',  
                   id=0, recurring=false)
    @id = id
    @name = name
    @account_number = number
    @website = website
    @email = email
    @phone = phone
    @recurring = recurring
    @bills = []
    end

    def self.create(name, account_number, website = '', email = '', phone = '',
                    id=0, recurring=false)
    a = Account.new(name, account_number, website, email, phone, id, recurring)
    a.persist!
    a.id = db.execute("select last_insert_rowid()")
    a
    end

    def self.find_by_name(name)
      db.execute("select * from Accounts where name='#{name}'") do |row|
        return Account.new(row[1], row[2], row[0], row[3].to_i > 0)
      end
    end

    def self.find_by_account_number(number)
      db.execute("select * from Accounts where account_number='#{number}'") do |row|
        return Account.new(row[1], row[2], row[0], row[3].to_i > 0)
      end
    end

    def self.find_website_by_account_name(name)
      db.execute("select * from Accounts where name = '#{name}'") do |row|
        return Account.new(row[1], row[2], row[3], row[4], row[5],  row[0], row[6].to_i > 0)
      end
    end

    def add_bill(due_date, amount, account_id)
      @bills << Bill.new(due_date, amount, account_id)
      @bills[0].persist!
      @bills
    end

    def persist!
      # TODO - Extract into "migration" ??
      db.execute("CREATE TABLE IF NOT EXISTS Accounts(id INTEGER PRIMARY KEY, 
                  name UNIQUE NOT NULL, account_number, website, email, phone,
                  recurring)" )
      db.execute("INSERT INTO Accounts Values(NULL, ?, ?, ?, ?, ?, ?)", 
                 @name, @account_number, @website, @email, @phone, @recurring ? 1 : 0 )
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
