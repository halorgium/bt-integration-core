require File.join(File.dirname(__FILE__), 'spec_helper')

describe Braintree::Transaction do
  it { Braintree::Transaction.should_not be_nil }
end
