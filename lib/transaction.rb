module Braintree
    class Transaction < GatewayRequest
      grouped_accessor :attributes, :type

      # methods which transmit info
      # validate state before transmit
      # validated conditions may vary depending on type (method used)
      def initialize(attrs = {})
        super
        self.path = "api/transact.php"
      end

      def sale;      self.type = 'sale'      end
      def refund;    self.type = 'refund'    end
      def credit;    self.type = 'credit'    end
      def update;    self.type = 'update'    end
      def authorize; self.type = 'authorize' end
      
    private

    # make sure all required parameters were provided
    # this one is for the generic case
    def validate
    end
  end
end
