require File.join(File.dirname(__FILE__), 'spec_helper')

describe Braintree::GatewayRequest do
  before(:each) do
    @account = stub("PaymentMethod", :attributes => {:one => 1})
    @initialize_params = {:orderid => 123, :amount => 1_000_000, :account => @account}
    @request = Braintree::GatewayRequest.new(@initialize_params)
  end

  it { @request.attributes[:orderid].should == 123 }
  it { @request.attributes[:amount].should == 1_000_000 }
  
  it "should flatten account object" do
    @request.attributes[:one].should == 1
  end
  it "should turn recurring billing plans into proper SKU format" do
    @request.add_recurring_billing('monthly')
    @request.add_recurring_billing('weekly')
    @request.attributes['product_sku_1'].should == 'monthly'
    @request.attributes['product_sku_2'].should == 'weekly'
  end
end
