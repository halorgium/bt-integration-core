require File.join(File.dirname(__FILE__), 'spec_helper')

describe Braintree::Transaction do
  it { Braintree::Transaction.should_not be_nil }
end

describe Braintree::Transaction do
  before(:each) do
    @transaction = Braintree::Transaction.new
  end

#   describe 'ccnumber' do
#     it "should set variables[:ccnumber]" do
#       @transaction.ccnumber(1234)
#       @transaction.variables[:ccnumber].should == 1234
#     end
#     it "should return self" do
#       @transaction.ccnumber(1234).should be(@transaction)
#     end
#     it "should be aliased by card_number" do
#       @transaction.card_number(1234)
#       @transaction.variables[:ccnumber].should == 1234
#     end
#   end
end
