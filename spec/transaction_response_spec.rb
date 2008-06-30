require File.join(File.dirname(__FILE__), 'spec_helper')
require 'ostruct'

describe Braintree::TransactionResponse do
  before(:each) do
    @valid_response = OpenStruct.new(:body => "response=1&responsetext=SUCCESS&authcode=123456&transactionid=744061846&avsresponse=&cvvresponse=N&orderid=102330&type=sale&response_code=100&encoded=http%3A%2F%2Fwww%2Ebraintreeps%2Ecom%2Fblog")
    @invalid_response = OpenStruct.new(:body => "response=3&responsetext=Duplicate transaction REFID:13132563&authcode=&transactionid=0&avsresponse=&cvvresponse=&orderid=21650&type=sale&response_code=300")
    @response = Braintree::TransactionResponse.new(@valid_response)
  end

  describe "initialize" do
    it "should store original response in @http_response" do
      @response.http_response.should == @valid_response
    end
  end
  
  describe "to_hash" do
    it "should parse the body into key/value pairs" do
      @response.to_hash['response'].should == '1'
    end
    it "should cgi unescape the body" do
      @response.to_hash['encoded'].should == 'http://www.braintreeps.com/blog'
    end
  end
end
