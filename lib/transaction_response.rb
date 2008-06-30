require 'cgi'

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

    def to_hash
      CGI.unescape(http_response.body).split('&').inject({}) do |h, pair|
        k,v = pair.split('=')
        h[k] = v
        h
      end
    end
  end
end
