require File.join(File.dirname(__FILE__), 'spec_helper')

describe Braintree::Transaction do
  it { Braintree::Transaction.should_not be_nil }
end

describe Braintree::Transaction do
  before(:each) do
    @account = stub("PaymentMethod", :attributes => {:one => 1})
    @initialize_params = {:orderid => 123, :amount => 1_000_000, :account => @account}
    @transaction = Braintree::Transaction.new(@initialize_params)
  end

  it { @transaction.attributes[:orderid].should == 123 }
  it { @transaction.attributes[:amount].should == 1_000_000 }
  
  it "should flatten account object" do
    @transaction.attributes[:one].should == 1
  end
  it "should turn recurring billing plans into proper SKU format" do
    @transaction.add_recurring_billing('monthly')
    @transaction.add_recurring_billing('weekly')
    @transaction.attributes['product_sku_1'].should == 'monthly'
    @transaction.attributes['product_sku_2'].should == 'weekly'
  end
end
