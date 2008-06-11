module Braintree
  class GatewayRequest
    # code to make the post
    # steal from virtual_terminal

    URL_BASE = "https://secure.braintreepaymentgateway.com"

    attr_accessor :attributes, :time, :current_time, :variables, :query_string, :url_base, :url_path, :response

    def initialize(attributes = nil)
      self.attributes = attributes.nil? ? { } : attributes
      attributes.each { |k,v| self.send("#{k}=", v) } unless attributes.nil?
      set_variables_to_query_string if self.attributes.include?(:variables)
    end

    def send_request
      uri = URI.parse self.url
      server  = Net::HTTP.new uri.host, uri.port
      server.use_ssl = uri.scheme == 'https'
      server.verify_mode = OpenSSL::SSL::VERIFY_NONE

      # use POST instead of GET
      self.response = server.post uri.path, uri.query
    end

    def time; current_time.strftime("%Y%m%d%H%m%S") end
    
    def full_uri; "#{url_path}?#{query_string}" end

    def url_base; @url_base || URL_BASE end

    def url_uri; "#{url_base}/#{url_path}" end

    def url; "#{url_uri}?#{query_string}" end

    private
    # each value of the variables is changed to a string
    def set_variables_to_query_string
      self.variables.delete_if { |key, value| value.nil? || value.to_s.strip == "" }
      string_variables = self.variables.to_a.collect! { |pair| 
        pair[0] == "quick_query" ? pair[1] : pair.join("=")}
      self.query_string = string_variables.join("&")
      self.query_string << "&username=#{BRAINTREE[:username]}&password=#{BRAINTREE[:password]}"
    end
  end
end
