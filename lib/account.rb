class Account
  attr_accessor :name, :account_number, :current_due, :due_date,
    :last_payment_date, :last_payment_amount
  def initialize name, number, due, date, last_pmt_date, last_pmt_due
    @name = name
    @account_number = number
    @current_due = due
    @due_date = date
    @last_payment_date = last_pmt_date
    @last_payment_amount = last_pmt_due
  end
end
