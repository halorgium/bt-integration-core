# -*- coding: iso-8859-1 -*-
require 'cgi'

module Braintree
  class TransactionResponse
    # original response (with headers)
    attr_accessor :http_response

    # response values
    attr_accessor :response, :responsetext, :authcode, :transactionid, 
                  :avsresponse, :cvvresponse, :orderid, :type, :response_code

    RESPONSE_CODES = {
      '1' => 'Transaction Approved',
      '2' => 'Transaction Declined',
      '3' => 'Error in transaction data or system error'}

    #AVS Response Codes
    AVS_CODES = {
      'X' => 'Exact match, 9-character ZIP',
      'Y' => 'Exact match, 5-character numeric ZIP',
      'D' => 'Exact match, 5-character numeric ZIP',
      'M' => 'Exact match, 5-character numeric ZIP',
      'A' => 'Address match only',
      'B' => 'Address match only',
      'W' => '9-character numeric ZIP match only',
      'Z' => '5-character ZIP match only',
      'P' => '5-character ZIP match only',
      'L' => '5-character ZIP match only',
      'N' => 'No address or ZIP match',
      'C' => 'No address or ZIP match',
      'U' => 'Address unavailable',
      'G' => 'Non-U.S. Issuer, does not participate',
      'I' => 'Non-U.S. Issuer, does not participate',
      'R' => 'Issuer system unavailable',
      'E' => 'Not a mail/phone order',
      'S' => 'Service not supported',
      '0' => 'AVS Not Available',
      'O' => 'AVS Not Available',
      'B' => 'AVS Not Available'}
    #CVV Response Codes
    CVV_CODES = {
      'M' => 'CVV2/CVC2 Match',
      'N' => 'CVV2/CVC2 No Match',
      'P' => 'Not Processed',
      'S' => 'Merchant has indicated that CVV2/CVC2 is not present on card',
      'U' => 'Issue is not certified and/or has not provided Visa encryption keys'}

    CODEZ = {
      '100' => 'Transaction was approved',
      '200' => 'Transaction was declined by Processor',
      '201' => 'Do Not Honor',
      '202' => 'Insufficient Funds',
      '203' => 'Over Limit',
      '204' => 'Transaction not allowed',
      '220' => 'Incorrect Payment Data',
      '221' => 'No such card issuer',
      '222' => 'No card number on file with Issuer',
      '223' => 'Expired card',
      '224' => 'Invalid expiration date',
      '225' => 'Invalid card security code',
      '240' => 'Call Issuer for further information',
      '250' => 'Pick up card',
      '251' => 'Lost card',
      '252' => 'Stolen card',
      '253' => 'Fraudulent card',
      '260' => 'Declined with further instructions available (see response text)',
      '261' => 'Declined Stop all recurring payments',
      '262' => 'Declined Stop this recurring program',
      '263' => 'Declined Updated cardholder data available',
      '264' => 'Declined Retry in a few days',
      '300' => 'Transaction was rejected by gateway',
      '400' => 'Transaction error returned by processor',
      '410' => 'Invalid merchant configuration',
      '411' => 'Merchant account is inactive',
      '420' => 'Communication error',
      '421' => 'Communication error with issuer',
      '430' => 'Duplicate transaction at processor',
      '440' => 'Processor format error',
      '441' => 'Invalid transaction information',
      '460' => 'Processor feature not available',
      '461' => 'Unsupported card type'}

    def initialize(response)
      @http_response = response
      to_hash.each{ |k,v| send "#{k}=", v }
    end

    def header
      http_response.header
    end

    def body
      http_response.body
    end

    def success?
      http_response.is_a? Net::HTTPOK
    end

    def to_hash
      @as_hash ||= CGI.unescape(http_response.body).split('&').inject({}) do |h, pair|
        k,v = pair.split('=')
        h[k] = v
        h
      end
    end
  end
end
