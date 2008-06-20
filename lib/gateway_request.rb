require 'grouped_accessor'
module Braintree
  class GatewayRequest
    extend GroupedAccessor
    attr_accessor :path
    grouped_accessor :attributes, :account, :amount, {:orderid => :order_id}
    # optional
    grouped_accessor :attributes, :processor_id, :tax, :shipping, 
                                  {:orderdescription => :order_description, 
                                   :ponumber => :purchase_order}
    grouped_accessor(:attributes,
                     :company,
                     :address2,
                     :fax,
                     :website,
                     :shipping_firstname,
                     :shipping_lastname,
                     :shipping_company,
                     :shipping_address1,
                     :shipping_address2,
                     :shipping_city,
                     :shipping_state,
                     :shipping_zip,
                     :shipping_country,
                     :tracking_number,
                     :shipping_carrier,
                     :sec_code,
                     :descriptor,
                     :descriptor_phone,
                     :orderid)

    def initialize(attrs = {})
      attrs.each{ |k,v| send("#{k}=", v) }
      @recurring_billing = []
    end

    def add_recurring_billing(plan)
      @recurring_billing << plan
    end

    alias_method :attributes_of_this_instance, :attributes
    def attributes
      a = attributes_of_this_instance
      if a[:account].respond_to?(:attributes)
        a.merge!(a[:account].attributes)
        a.delete(:account)
      end
      @recurring_billing.each_with_index { |plan, i| a["product_sku_#{i+1}"]=plan }
      a
    end
#    def time; @time ||= Time.now.getutc.strftime("%Y%m%d%H%m%S") end
  end
end
