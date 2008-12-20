require 'braintree/grouped_accessor'
module Braintree
  class GatewayRequest
    attr_accessor :path
#    def time; @time ||= Time.now.getutc.strftime("%Y%m%d%H%m%S") end
  end
end
