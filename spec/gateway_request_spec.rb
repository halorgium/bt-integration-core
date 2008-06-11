require File.join(File.dirname(__FILE__), 'spec_helper')

describe Braintree::GatewayRequest do
  it { Braintree::GatewayRequest.should_not be_nil }
end
