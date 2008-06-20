require File.join(File.dirname(__FILE__), 'spec_helper')

describe Braintree::GatewayRequest do
  before(:each) do
    @account = stub("PaymentMethod", :attributes => {:one => 1})
    @initialize_params = {:orderid => 123, :amount => 1_000_000, :account => @account}
    @request = Braintree::GatewayRequest.new(@initialize_params)
  end

  it { @request.attributes[:orderid].should == 123 }
  it { @request.attributes[:amount].should == 1_000_000 }
  it { @request.attributes[:one].should == 1 }
end
