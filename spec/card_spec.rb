require File.join(File.dirname(__FILE__), 'spec_helper')

describe Braintree::Card do
  it "should inherit from PaymentType" do
    Braintree::Card.new.should be_a_kind_of(Braintree::PaymentType)
  end
end