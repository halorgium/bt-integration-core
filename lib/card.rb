module Braintree
  class Card < PaymentType
    # required
    attr_accessor :ccnumber, :ccexp

    # optional (recommended)
    attr_accessor :cvv

    def valid?
      ccnumber && ccnumber.to_s =~ /^\d{16}$/ &&
        ccexp && ccexp.to_s =~ /^\d{4}$/
    end
  end
end
