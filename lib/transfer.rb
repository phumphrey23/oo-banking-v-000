class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @amount < @sender.balance && @status = "pending" && self.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @last_transaction = @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status = "complete"
      @receiver.balance -= @last_transaction
      @sender.balance += @last_transaction
      @status = "reversed"
    end
  end

end
