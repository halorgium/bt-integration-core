module Braintree
  class TransactionResponse
    attr_accessor :http_response
    def initialize(response)
      @http_response = response
    end

    def header
      http_response.header
    end

    def body
      http_response.body
    end

    def success?
      http_response.is_a? Net::HTTPOK
    end

    
  end
end
