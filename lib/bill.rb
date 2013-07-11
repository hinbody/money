class Bill
  attr_accessor :due_date, :amount

  def initialize(due_date, amount)
    @due_date = due_date
    @amount = amount
  end
end
