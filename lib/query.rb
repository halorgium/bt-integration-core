module Braintree
  class Query < GatewayRequest
    URL_PATH = '/api/query.php'

    def initialize(args = nil)
      self.url_path = URL_PATH
      super
    end
  end
end
