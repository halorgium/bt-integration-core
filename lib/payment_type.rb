module Braintree
  class PaymentType
    # optional attributes
    attr_accessor :ipaddress, :firstname, :lastname,
                  :address1,  :city,      :state,     :zip,
                  :country,   :phone,     :email

    attr_accessor :attributes

    def initialize(attrs={})
      self.attributes = attrs
      attrs.each{ |k,v| send("#{k}=", v) }
    end
  end
end
