require 'rexml/document'

module Braintree
  class GatewayResponse
    attr_accessor :xml
    def initialize(xml_response)
      self.xml = xml_response
      @doc = REXML::Document.new xml, :compress_whitespace => :all
    end

    def each_transaction
      @doc.elements.each('/nm_response/transaction') {|t| yield t}
    end

    def error_string
      e = @doc.elements['/nm_response/error_response']
      e ? e.text : ''
    end
    
    def errors?
      !error_string.empty?
    end

    def length
      @doc.get_elements('/nm_response/transaction').size
    end
    alias :size :length
  end
end
