require File.join(File.dirname(__FILE__), 'spec_helper')

describe Braintree::Query do
  it { Braintree::Query.should_not be_nil }
end
