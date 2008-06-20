module Braintree
  class Card < PaymentType
    # required
    grouped_accessor :attributes, {:ccnumber => :number, :ccexp => :expiration}
    # optional (recommended)
    grouped_accessor :attributes, :cvv

    def initialize(attrs = {})
      super
      self.payment = 'creditcard'
    end

    def valid?
      valid_number? && valid_expiration?
    end
    
    def valid_number?
      number && number.to_s =~ /^\d{16}$/
    end

    def valid_expiration?
      expiration && expiration.to_s =~ /^\d{4}$/
    end
  end
end
