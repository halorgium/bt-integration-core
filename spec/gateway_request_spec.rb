require File.join(File.dirname(__FILE__), 'spec_helper')

describe Braintree::GatewayRequest do
  before(:each) do
    @initialize_params = {:sym => 'str'}
    @request = Braintree::GatewayRequest.new(@initialize_params)
  end

  it { @request.attributes.should == @initialize_params }
end
