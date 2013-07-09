class Account
  attr_accessor :name, :account_number, :current_due, :due_date,
    :last_payment_date, :last_payment_amount
  def initialize name, number
    @name = name
    @account_number = number
  end

  def self.list
    @list ||= []
    @list
  end


  def self.create name, account_number
    a = Account.new(name, account_number)
    a.persist!
  end

  def self.find_by_name name
    list.first
  end

  def persist!
    #self.class.list << self
    db = SQLite3::Database.open "money.db"
    db.execute "CREATE TABLE IF NOT EXISTS Accounts(name, account_number, recurring)"
    db.execute "INSERT INTO Accounts Values(#{a.name}, #{a.account_number}, #{a.recurring})"

  rescue SQLite3::Exception => e

    puts "Exception occured"
    puts e

  ensure
    db.close if db
  end

  def update_name new_name
   self.name = new_name
  end

  def update_account_number new_number
    self.account_number = new_number
  end

  def update_current_due new_amount
    #need to do something here to archive last amount
    self.current_due = new_amount
  end

  def update_due_date new_date
    #need to do something here to archive last due date
    self.due_date = new_date
  end

  def update_last_payment_date new_paid_date
    #need to do something here to archive last date
    self.last_payment_date = new_paid_date
  end

  def update_last_payment_amount new_paid_amount
    #need to do something here to archinve last amount
    self.last_payment_amount = new_paid_amount
  end
end
