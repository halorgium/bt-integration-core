require File.join(File.dirname(__FILE__), 'spec_helper')

describe Braintree::GatewayRequest, "(initialize)" do
  before(:each) do
    @request = Braintree::GatewayRequest.new({:url_path => 'path'})
  end

  it "should set @attributes to match initializer args" do
    @request.attributes.should == {:url_path => 'path'}
  end

  it "should set all instance vars passed in args" do
    @request.url_path.should == 'path'
  end
end

describe Braintree::GatewayRequest do
  before(:each) do
    @request = Braintree::GatewayRequest.new
  end

  describe "url_base" do
    it "should default to URL_BASE" do
      @request.url_base.should == Braintree::GatewayRequest::URL_BASE
    end
    it "should be overridable" do
      @request.url_base = "foo"
      @request.url_base.should == "foo"
    end
  end

  describe "url_uri" do
    it "should concat url_base and url_path" do
      @request.url_path = 'path'
      @request.url_base = 'base'
      @request.url_uri.should == 'base/path'
    end
  end

  describe "full_uri" do
    it "should concat url_path with query_string" do
      @request.url_path = 'path'
      @request.query_string = 'query'
      @request.full_uri.should == 'path?query'
    end
  end
  
  describe "url" do
    it "should concatenate url_uri and query_string" do
      @request.stub!(:url_uri).and_return('url_uri')
      @request.query_string = 'query'
      @request.url.should == 'url_uri?query'
    end
  end
end
