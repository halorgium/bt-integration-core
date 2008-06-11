module Braintree
    class Transaction < GatewayRequest
    # methods which transmit info
    # validate state before transmit
    # validated conditions may vary depending on type (method used)
    def sale
    end
    def refund
    end
    def credit
    end
    def update
    end
    def authorize
    end

    private

    # make sure all required parameters were provided
    # this one is for the generic case
    def validate
    end
  end
end
