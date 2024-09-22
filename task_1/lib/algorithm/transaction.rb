module Algorithm
  class Transaction
    attr_accessor :timestamp, :transaction_id, :user_id, :amount

    def initialize(timestamp, transaction_id, user_id, amount)
      @timestamp = timestamp
      @transaction_id = transaction_id
      @user_id = user_id
      @amount = amount.to_f
    end
  end
end

