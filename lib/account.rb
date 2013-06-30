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
