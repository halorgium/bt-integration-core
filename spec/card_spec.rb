require File.join(File.dirname(__FILE__), 'spec_helper')

describe Braintree::Card do
  it "should inherit from PaymentType" do
    Braintree::Card.new.should be_a_kind_of(Braintree::PaymentType)
  end
  it "should default payment to creditcard" do
    Braintree::Card.new.payment.should == 'creditcard'
  end
end

describe Braintree::Card, 'validation' do
  before(:each) do
    @card = Braintree::Card.new
  end
  it "validates presence of ccnumber" do
    @card.should_not be_a_valid_number
  end
  it "validates format of ccnumber" do
    @card.number = 12345
    @card.should_not be_a_valid_number
  end
  it "validates a properly formatted ccnumber" do
    @card.number = '1234567890123456'
    @card.should be_a_valid_number
  end
  it "validates presence of expiration" do
    @card.should_not be_a_valid_expiration
  end
  it "validates format of expiration" do
    @card.expiration = "may 1"
    @card.should_not be_a_valid_expiration
  end
  it "validates a proper expiration" do
    @card.expiration = 1009
    @card.should be_a_valid_expiration
  end
  it "is valid iff number and expiration are both valid" do
    @card.should_receive(:valid_expiration?).and_return(true)
    @card.should_receive(:valid_number?).and_return(true)
    @card.should be_valid
  end
end
