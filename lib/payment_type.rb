require 'grouped_accessor'
module Braintree
  class PaymentType
    extend GroupedAccessor
    # required attributes
    grouped_accessor :attributes, :payment
    # optional attributes
    grouped_accessor :attributes, :ipaddress, :firstname, :lastname,
                                  :address1,  :city,      :state,     :zip,
                                  :country,   :phone,     :email

    def initialize(attrs={})
      attrs.each{ |k,v| send("#{k}=", v) }
    end
  end
end
