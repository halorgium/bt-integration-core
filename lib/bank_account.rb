module Braintree
  class BankAccount < PaymentType
    # required
    attr_accessor :checkname, :checkaba, :checkaccount, :account_holder_type, :account_type
  end

  def valid?
    checkname && checkaba && checkaccount && account_holder_type && account_type
  end
end
