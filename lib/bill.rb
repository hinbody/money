class Bill
  attr_accessor :due_date, :amount

  def initialize(due_date, amount)
    @due_date = due_date
    @amount = amount
  end

  def persist!
    db.execute "CREATE TABLE IF NOT EXISTS Bills(due_date, amount)"
    db.execute "INSERT INTO Bills Values(?, ?)", @due_date, @amount
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
