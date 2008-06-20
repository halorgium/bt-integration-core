module Braintree
  class BankAccount < PaymentType
    # required
    grouped_accessor :attributes, :checkname, :checkaba, :checkaccount, :account_holder_type, :account_type
  end

  def initialize(attrs = {})
    super
    self.payment = 'check'
  end

  def valid?
    checkname && checkaba && checkaccount && account_holder_type && account_type
  end
end
