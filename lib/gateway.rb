require 'rubygems'
require 'uri'
require 'net/https'
require 'hpricot'

module Braintree
  class Gateway
    URL_BASE = "https://secure.braintreepaymentgateway.com"

    attr_accessor :url_base, :last_response

    def initialize(username, password)
      @username, @password = username, password
    end

    def post(transaction)
      uri = URI.parse url(transaction)
      server  = Net::HTTP.new uri.host, uri.port
      server.use_ssl = uri.scheme == 'https'
      server.verify_mode = OpenSSL::SSL::VERIFY_NONE

      # use POST instead of GET
      response = server.post uri.path, uri.query
      self.last_response = Braintree::GatewayResponse.new(response.body)
    end

    def time; Time.now.getutc.strftime("%Y%m%d%H%m%S") end
    
    def url_base; @url_base || URL_BASE end

    def url(transaction)
      "#{url_base}/#{transaction.path}?#{query_string(transaction)}"
    end

    private
    # each value of the variables is changed to a string
    def query_string(transaction)
      #variables[:time] = time
      string_variables = transaction.attributes.to_a.map do |pair| 
        if pair[1].nil? || pair.to_s.strip == ""
          nil
        elsif pair[0] == "quick_query"
          pair[1] 
        else
          pair.join("=")
        end
      end
      string_variables.compact!
      string_variables << "username=#@username"
      string_variables << "password=#@password"
      string_variables.join("&")
    end
  end
end
