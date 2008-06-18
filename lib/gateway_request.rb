module Braintree
  class GatewayRequest
    attr_accessor :attributes, :path

    def initialize(attrs = {})
      self.attributes = attrs
    end

#     class << self
#       # provide a class level method which gives method access to the variables hash
#       # it should allow aliasing
#       # it should return self, for chaining method calls together
#       def bt_variable(name, options = {})
#         meth = name.to_sym
#         define_method(meth) do |val|
#           variables[meth] = val
#           self
#         end
#         alias_method(options[:alias].to_sym, meth) if options[:alias]
#       end
#     end

#    def time; @time ||= Time.now.getutc.strftime("%Y%m%d%H%m%S") end
  end
end
