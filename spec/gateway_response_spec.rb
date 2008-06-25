require File.join(File.dirname(__FILE__), 'spec_helper')

describe Braintree::GatewayResponse do
  before(:each) do
    @xml_response = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<nm_response>\n\t<transaction>\n\t\t<transaction_id>648722205</transaction_id>\n\t\t<platform_id></platform_id>\n\t\t<transaction_type>cc</transaction_type>\n\t\t<condition>pendingsettlement</condition>\n\t\t<order_id>123456</order_id>\n\t\t<authorization_code>123456</authorization_code>\n\t\t<ponumber></ponumber>\n\t\t<order_description></order_description>\n\t\t<first_name></first_name>\n\t\t<last_name></last_name>\n\t\t<address_1></address_1>\n\t\t<address_2></address_2>\n\t\t<company></company>\n\t\t<city></city>\n\t\t<state></state>\n\t\t<postal_code></postal_code>\n\t\t<country></country>\n\t\t<email></email>\n\t\t<phone></phone>\n\t\t<fax></fax>\n\t\t<cell_phone></cell_phone>\n\t\t<customertaxid></customertaxid>\n\t\t<customerid></customerid>\n\t\t<website></website>\n\t\t<shipping_first_name></shipping_first_name>\n\t\t<shipping_last_name></shipping_last_name>\n\t\t<shipping_address_1></shipping_address_1>\n\t\t<shipping_address_2></shipping_address_2>\n\t\t<shipping_company></shipping_company>\n\t\t<shipping_city></shipping_city>\n\t\t<shipping_state></shipping_state>\n\t\t<shipping_postal_code></shipping_postal_code>\n\t\t<shipping_country></shipping_country>\n\t\t<shipping_email></shipping_email>\n\t\t<shipping_carrier></shipping_carrier>\n\t\t<tracking_number></tracking_number>\n\t\t<shipping_date></shipping_date>\n\t\t<shipping></shipping>\n\t\t<cc_number>4xxxxxxxxxxx1111</cc_number>\n\t\t<cc_hash>f6c609e195d9d4c185dcc8ca662f0180</cc_hash>\n\t\t<cc_exp>1010</cc_exp>\n\t\t<cavv></cavv>\n\t\t<cavv_result></cavv_result>\n\t\t<xid></xid>\n\t\t<avs_response></avs_response>\n\t\t<csc_response></csc_response>\n\t\t<cardholder_auth></cardholder_auth>\n\t\t<check_account></check_account>\n\t\t<check_hash></check_hash>\n\t\t<check_aba></check_aba>\n\t\t<check_name></check_name>\n\t\t<account_holder_type></account_holder_type>\n\t\t<account_type></account_type>\n\t\t<sec_code></sec_code>\n\t\t<processor_id>testcc</processor_id>\n\t\t<tax></tax>\n\t\t<cc_bin>411111</cc_bin>\n\t\t<action>\n\t\t\t<amount>1.00</amount>\n\t\t\t<action_type>sale</action_type>\n\t\t\t<date>20080319191825</date>\n\t\t\t<success>1</success>\n\t\t\t<ip_address>24.31.188.140</ip_address>\n\t\t\t<source>api</source>\n\t\t\t<username>btcomdev</username>\n\t\t\t<response_text>SUCCESS</response_text>\n\t\t</action>\n\t</transaction>\n\t<transaction>\n\t\t<transaction_id>648736006</transaction_id>\n\t\t<platform_id></platform_id>\n\t\t<transaction_type>cc</transaction_type>\n\t\t<condition>pendingsettlement</condition>\n\t\t<order_id>123456</order_id>\n\t\t<authorization_code>123456</authorization_code>\n\t\t<ponumber></ponumber>\n\t\t<order_description></order_description>\n\t\t<first_name></first_name>\n\t\t<last_name></last_name>\n\t\t<address_1></address_1>\n\t\t<address_2></address_2>\n\t\t<company></company>\n\t\t<city></city>\n\t\t<state></state>\n\t\t<postal_code></postal_code>\n\t\t<country></country>\n\t\t<email></email>\n\t\t<phone></phone>\n\t\t<fax></fax>\n\t\t<cell_phone></cell_phone>\n\t\t<customertaxid></customertaxid>\n\t\t<customerid></customerid>\n\t\t<website></website>\n\t\t<shipping_first_name></shipping_first_name>\n\t\t<shipping_last_name></shipping_last_name>\n\t\t<shipping_address_1></shipping_address_1>\n\t\t<shipping_address_2></shipping_address_2>\n\t\t<shipping_company></shipping_company>\n\t\t<shipping_city></shipping_city>\n\t\t<shipping_state></shipping_state>\n\t\t<shipping_postal_code></shipping_postal_code>\n\t\t<shipping_country></shipping_country>\n\t\t<shipping_email></shipping_email>\n\t\t<shipping_carrier></shipping_carrier>\n\t\t<tracking_number></tracking_number>\n\t\t<shipping_date></shipping_date>\n\t\t<shipping></shipping>\n\t\t<cc_number>4xxxxxxxxxxx1111</cc_number>\n\t\t<cc_hash>f6c609e195d9d4c185dcc8ca662f0180</cc_hash>\n\t\t<cc_exp>1010</cc_exp>\n\t\t<cavv></cavv>\n\t\t<cavv_result></cavv_result>\n\t\t<xid></xid>\n\t\t<avs_response></avs_response>\n\t\t<csc_response></csc_response>\n\t\t<cardholder_auth></cardholder_auth>\n\t\t<check_account></check_account>\n\t\t<check_hash></check_hash>\n\t\t<check_aba></check_aba>\n\t\t<check_name></check_name>\n\t\t<account_holder_type></account_holder_type>\n\t\t<account_type></account_type>\n\t\t<sec_code></sec_code>\n\t\t<processor_id>testcc</processor_id>\n\t\t<tax></tax>\n\t\t<cc_bin>411111</cc_bin>\n\t\t<action>\n\t\t\t<amount>5000.00</amount>\n\t\t\t<action_type>sale</action_type>\n\t\t\t<date>20080319195113</date>\n\t\t\t<success>1</success>\n\t\t\t<ip_address>24.31.188.140</ip_address>\n\t\t\t<source>api</source>\n\t\t\t<username>btcomdev</username>\n\t\t\t<response_text>SUCCESS</response_text>\n\t\t</action>\n\t</transaction>\n</nm_response>\n"
    @nested_response = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<nm_response>\n\t<transaction>\n\t\t<transaction_id>648736006</transaction_id>\n\t\t<platform_id></platform_id>\n\t\t<transaction_type>cc</transaction_type>\n\t\t<condition>pendingsettlement</condition>\n\t\t<order_id>123456</order_id>\n\t\t<authorization_code>123456</authorization_code>\n\t\t<ponumber></ponumber>\n\t\t<order_description></order_description>\n\t\t<first_name></first_name>\n\t\t<last_name></last_name>\n\t\t<address_1></address_1>\n\t\t<address_2></address_2>\n\t\t<company></company>\n\t\t<city></city>\n\t\t<state></state>\n\t\t<postal_code></postal_code>\n\t\t<country></country>\n\t\t<email></email>\n\t\t<phone></phone>\n\t\t<fax></fax>\n\t\t<cell_phone></cell_phone>\n\t\t<customertaxid></customertaxid>\n\t\t<customerid></customerid>\n\t\t<website></website>\n\t\t<shipping_first_name></shipping_first_name>\n\t\t<shipping_last_name></shipping_last_name>\n\t\t<shipping_address_1></shipping_address_1>\n\t\t<shipping_address_2></shipping_address_2>\n\t\t<shipping_company></shipping_company>\n\t\t<shipping_city></shipping_city>\n\t\t<shipping_state></shipping_state>\n\t\t<shipping_postal_code></shipping_postal_code>\n\t\t<shipping_country></shipping_country>\n\t\t<shipping_email></shipping_email>\n\t\t<shipping_carrier></shipping_carrier>\n\t\t<tracking_number></tracking_number>\n\t\t<shipping_date></shipping_date>\n\t\t<shipping></shipping>\n\t\t<cc_number>4xxxxxxxxxxx1111</cc_number>\n\t\t<cc_hash>f6c609e195d9d4c185dcc8ca662f0180</cc_hash>\n\t\t<cc_exp>1010</cc_exp>\n\t\t<cavv></cavv>\n\t\t<cavv_result></cavv_result>\n\t\t<xid></xid>\n\t\t<avs_response></avs_response>\n\t\t<csc_response></csc_response>\n\t\t<cardholder_auth></cardholder_auth>\n\t\t<check_account></check_account>\n\t\t<check_hash></check_hash>\n\t\t<check_aba></check_aba>\n\t\t<check_name></check_name>\n\t\t<account_holder_type></account_holder_type>\n\t\t<account_type></account_type>\n\t\t<sec_code></sec_code>\n\t\t<processor_id>testcc</processor_id>\n\t\t<tax></tax>\n\t\t<cc_bin>411111</cc_bin>\n\t\t<action>\n\t\t\t<amount>5000.00</amount>\n\t\t\t<action_type>sale</action_type>\n\t\t\t<date>20080319195113</date>\n\t\t\t<success>1</success>\n\t\t\t<ip_address>24.31.188.140</ip_address>\n\t\t\t<source>api</source>\n\t\t\t<username>btcomdev</username>\n\t\t\t<response_text>SUCCESS</response_text>\n\t\t<nesting1><nesting2>huh</nesting2><nesting3><sucka>wha</sucka></nesting3></nesting1></action>\n\t</transaction>\n</nm_response>\n"
    @error_response = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<nm_response>\n\t<error_response>errorz</error_response>\n</nm_response>\n"
    @empty_response = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<nm_response>\n</nm_response>\n"
    @response = Braintree::GatewayResponse.new(@xml_response)
  end

  describe "initialize" do
    it "should store original format in @xml" do
      @response.xml.should == @xml_response
    end
  end

  describe "each_transaction" do
    it "should yield 2 transactions" do
      i = 0
      @response.each_transaction {|t| i += 1 }
      i.should == 2
    end
    it "should handle the 0 results case" do
      @response = Braintree::GatewayResponse.new(@empty_response)
      n=0
      @response.each_transaction {|t| n+=1}
      n.should == 0
    end
  end

  describe "error_string" do
    it "should return empty string if no errors" do
      @response.error_string.should == ''
    end
    it "should return string between the error_response tags" do
      @response = Braintree::GatewayResponse.new(@error_response)
      @response.error_string.should == 'errorz'
    end
  end
  
  describe "errors?" do
    it "should return true if error_string is non-empty" do
      @response = Braintree::GatewayResponse.new(@error_response)
      @response.errors?.should be_true
    end
    it "should return false if no errors" do
      @response.errors?.should be_false
    end
  end

  it "should return number of transaction elements" do
    @response.length.should == 2
  end
require 'pp'
  it "should recursively_apply" do
    @response = Braintree::GatewayResponse.new(@nested_response)
    h = @response.to_hash(@response.transactions.first)
    pp h
  end
end
