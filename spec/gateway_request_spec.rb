require File.join(File.dirname(__FILE__), 'spec_helper')

describe Braintree::GatewayRequest do
  before(:each) do
    @merge_attrs = {:one => 1}
    @m = mock("Account", :attributes => @merge_attrs)
    @initialize_params = {:sym => 'str', :merge_me => @m}
    @request = Braintree::GatewayRequest.new(@initialize_params)
  end

  it { @request.attributes.should == @initialize_params }

  describe 'flatten' do
    it "merges attributes" do
      @request.flatten(:merge_me)
      @request.attributes.should have_key(:one)
    end

    it "deletes original key/value" do
      @request.flatten(:merge_me)
      @request.attributes.should_not have_key(:merge_me)
    end
  end
  
  describe 'account=' do
    it "should call flatten" do
      @request.should_receive(:flatten).with(:account)
      @request.account = @m
    end
  end
end
