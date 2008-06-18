module Braintree
  class Query < GatewayRequest
    URL_PATH = '/api/query.php'

    def initialize(args = {})
      self.path = URL_PATH
      super
    end
  end
end
