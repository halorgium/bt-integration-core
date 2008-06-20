require 'grouped_accessor'
module Braintree
  class GatewayRequest
    extend GroupedAccessor
    attr_accessor :path
    grouped_accessor :attributes, :account, :orderid, :amount

    def initialize(attrs = {})
      attrs.each{ |k,v| send("#{k}=", v) }
    end

    alias_method :attributes_of_this_instance, :attributes
    def attributes
      a = attributes_of_this_instance
      if a[:account].respond_to?(:attributes)
        a.merge!(a[:account].attributes)
        a.delete(:account)
      end
      a
    end
#    def time; @time ||= Time.now.getutc.strftime("%Y%m%d%H%m%S") end
  end
end
