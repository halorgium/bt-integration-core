require File.join(File.dirname(__FILE__), 'spec_helper')

describe Braintree::PaymentType, "initialize" do
  before(:each) do
    @pt = Braintree::PaymentType.new(:firstname => 'koopa', :lastname => 'troopa')
  end

  it "should set accessors from attribute hash" do
    @pt.firstname.should == 'koopa'
    @pt.lastname.should  == 'troopa'
  end
end
