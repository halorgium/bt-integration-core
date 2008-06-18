module Braintree
    class Transaction < GatewayRequest
      attr_accessor :payment_details

      # methods which transmit info
      # validate state before transmit
      # validated conditions may vary depending on type (method used)
      def initialize(attrs = {})
        super
        self.path = "api/transact.php"
      end

#       bt_variable :ccnumber, :alias => :card_number
#       bt_variable :ccexp,    :alias => :expiration
#       bt_variable :checkname,    :alias => :check_name

      def sale
        attributes[:type] = 'sale'
# ccnumber (required)
# ccexp (required) Format: MMYY
# checkname (required)
# checkaba (required)
# checkaccount (required)
# account_holder_type (required) Format: business / personal
# account_type (required) Format: checking / savings
# amount (required) Format: x.xx
# cvv (recommended)
# ipaddress (recommended) Format: xxx.xxx.xxx.xxx
# firstname (recommended)
# lastname (recommended)
# address1 (recommended)
# city (recommended)
# state (recommended) Format: CC
# zip (recommended)
# country (recommended) Format: CC (ISO-3166)
# phone (recommended)
# email (recommended)
# payment (recommended) Format: creditcard / check
#     Set Payment type to ACH or Credit Card. Note: either check or creditcard information can be passed to the Braintree Payment Gateway, but not together. Doing so will result in an error.
# processor_id (optional)
#     The processor number of the processor that you want to use, assuming that you have multiple MIDs setup in your account. The processor ID is obtained under the Option => Load Balancing section in the Braintree Virtual Terminal Control Panel.
# product_sku_# (optional) Format: product_sku_1
#     Associate API call with Recurring SKU#. This value is a number, starting with 1 for each recurring Billing plan that you add the customer to. For example, to add a single plan called monthly to a user, you would pass product_sku_1=monthly. The order is not important.
# orderdescription (optional)
# tax (optional) Format: x.xx
#     Required for LEVEL 2 Processing Total tax amount.
# shipping (optional) Format: x.xx
#     Required for Level 2 processing. Total shipping amount.
# ponumber (optional)
#     Required for Level 2 processing. Original Purchase Order number.
# company (optional)
# address2 (optional)
# fax (optional)
# website (optional)
# shipping_firstname (optional)
# shipping_lastname (optional)
# shipping_company (optional)
# shipping_address1 (optional)
# shipping_address2 (optional)
# shipping_city (optional)
# shipping_state (optional)
# shipping_zip (optional)
# shipping_country (optional) Format: CC (ISO-3166)
# tracking_number (optional)
# shipping_carrier (optional) Format: ups / fedex / dhl / usps
# sec_code (optional) Format: PPD / WEB / TEL / CCD
#     ACH Standard Entity Class codes.
# descriptor (optional)
#     Set payment descriptor (On supported processors)
# descriptor_phone (optional)
#     Set payment descriptor phone (On supported processors)
# orderid (optional)
    end
    def refund
    end
    def credit
    end
    def update
    end
    def authorize
    end

    private

    # make sure all required parameters were provided
    # this one is for the generic case
    def validate
    end
  end
end
