require File.join(File.dirname(__FILE__), 'spec_helper')

describe Braintree::BankAccount do
  it "should inherit from PaymentType" do
    Braintree::BankAccount.new.should be_a_kind_of(Braintree::PaymentType)
  end
  it "should default payment to check" do
    Braintree::BankAccount.new.payment.should == 'check'
  end
end
