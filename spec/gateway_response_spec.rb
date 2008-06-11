require File.join(File.dirname(__FILE__), 'spec_helper')

describe Braintree::GatewayResponse do
  it { Braintree::GatewayResponse.should_not be_nil }
end
