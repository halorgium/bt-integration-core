require 'rexml/document'

module Braintree
  class QueryResponse
    attr_accessor :http_response, :xml
    def initialize(response)
      @http_response = response
      @xml = response.body
      @doc = REXML::Document.new(xml, :ignore_whitespace_nodes => :all, :compress_whitespace => :all)
    end

    def transactions
      @transactions ||= @doc.get_elements('/nm_response/transaction')
    end

    def each_transaction(type = :rexml)
      case type
      when :rexml
        transactions.each {|t| yield t}
      when :hash
        transactions.each {|t| yield to_hash(t)}
      end
    end

    def error_string
      @error_string ||= @doc.elements['/nm_response/error_response']
      @error_string ? @error_string.text : ''
    end
    
    def errors?
      !error_string.empty?
    end

    def length
      transactions.size
    end
    alias :size :length

    def to_hash(node)
      if node.text
        node.text
      elsif node.children.size > 0
        node.children.inject({}) { |hash,child| hash[child.name] = to_hash(child); hash }
      else
        nil
      end
    end
  end
end
