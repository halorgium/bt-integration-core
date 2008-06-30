require File.join(File.dirname(__FILE__), 'spec_helper')
require 'ostruct'

describe Braintree::TransactionResponse do
  before(:each) do
    @valid_response = OpenStruct.new(:body => "")
    @response = Braintree::TransactionResponse.new(@valid_response)
  end

  describe "initialize" do
    it "should store original response in @http_response" do
      @response.http_response.should == @valid_response
    end
  end
end
