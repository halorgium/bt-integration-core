module Braintree
  class Card < PaymentType
    # required
    grouped_accessor :attributes, {:ccnumber => :number, :ccexp => :expiration}

    # optional (recommended)
    grouped_accessor :attributes, :cvv

    def valid?
      number && number.to_s =~ /^\d{16}$/ &&
        expiration && expiration.to_s =~ /^\d{4}$/
    end
  end
end
