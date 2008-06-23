require 'grouped_accessor'
module Braintree
  class Transaction < GatewayRequest
    extend GroupedAccessor

      # required
      grouped_accessor :attributes, :account, :amount, :type, {:orderid => :order_id}

      # optional
      grouped_accessor(:attributes,
                       :processor_id, 
                       :tax, 
                       :shipping, 
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
                       :orderid,
                       { :orderdescription => :order_description, 
                         :ponumber => :purchase_order})

      # methods which transmit info
      # validate state before transmit
      # validated conditions may vary depending on type (method used)
    def initialize(attrs = {})
      attrs.each{ |k,v| send("#{k}=", v) }
      @recurring_billing = []
      self.path = "api/transact.php"
    end

    def sale;      self.type = 'sale'      end
    def refund;    self.type = 'refund'    end
    def credit;    self.type = 'credit'    end
    def update;    self.type = 'update'    end
    def authorize; self.type = 'authorize' end
    
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

    private

    # make sure all required parameters were provided
    # this one is for the generic case
    def validate
    end
  end
end
