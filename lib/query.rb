# -*- coding: undecided -*-
module Braintree
  class Query < GatewayRequest
    URL_PATH = '/api/query.php'

    def initialize(args = {})
      self.path = URL_PATH
      super
    end

# email (recommended)
#     Billing email address.
# orderid (optional)
#     Order ID
# last_name (optional)
#     Retrieves only transactions with the specified last name.
# cc_number (optional)
#     Retrieves only transactions with the specified credit card number. You can use either the full number or the last 4 digits of the number.
# start_date (optional)
#     Only transactions that have been modified on or after this date will be retrieved. Note that any actions performed on a transaction (ie. a VOID) will case the modified date to be updated.
# end_date (optional)
#     Only transactions that have been modified on or before this date will be retrieved. Note that any actions performed on a transaction (ie. a VOID) will case the modified date to be updated.
# condition (optional)
#     Retrieves only transactions with the specified transaction condition.
#     pending 	'Auth Only' transactions that are awaiting capture will be in this condition.
#     pendingsettlement 	The transaction is awaiting settlement.
#     failed 	The transaction has permanently failed.
#     canceled 	The transaction has been voided.
#     complete 	The transaction has been settled.
#     unknown 	This means a serious error was encountered while processing the transaction.
#     A combination of the values above can be used, and should be separated by commas. For example, to retrieve all transactions pending settlement or complete, the following could be used:
#        1  
#        2  condition=pendingsettlement,complete

# transaction_type (optional)
#     Retrieves only transactions with the specified transaction type. Use one of the following codes to designate transaction type:
#     Code 	Status
#     cc 	Credit Card Transaction
#     ck 	Check Transaction
# action_type (optional)
#     Retrieves only transactions with the specified action types.
#         * sale
#         * refund
#         * credit
#         * auth
#         * capture
#         * void
#     A combination of the values above can be used, and should be separated by commas. For example, to retrieve all transactions with credit or refund actions, use the following:
#        1  
#        2  action_type=refund,credit
# transaction_id (optional)
#     Original Payment Gateway Transaction ID. This value was passed in the response of a previous Gateway Transaction. Please note that in the Payment Gateway, this value is called transaction (no underscore).
# report_type (optional) Format: customer_vault
#     When running a query against the SecureVault, make sure to include this parameter and value:
#     report_type=customer_vault

  end
end
