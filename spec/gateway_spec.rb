require File.join(File.dirname(__FILE__), 'spec_helper')

describe Braintree::Gateway do
  before(:each) do
    @gw = Braintree::Gateway.new('user', 'pass')
  end

  describe "initialize" do
    it "should set @username" do
      @gw.instance_variable_get('@username').should == 'user'
    end
    it "should set @username" do
      @gw.instance_variable_get('@password').should == 'pass'
    end
  end

  describe "url_base" do
    it "should default to URL_BASE" do
      @gw.url_base.should == Braintree::Gateway::URL_BASE
    end
    it "should be overridable" do
      @gw.url_base = "foo"
      @gw.url_base.should == "foo"
    end
  end

  describe "url" do
    before(:each) do
      @t = mock("Transaction", :path => 'path' )
      @gw.url_base = 'base'
    end

    it "should concatenate base and path" do
      @gw.stub!(:query_string)
      @gw.url(@t).should match(/^base\/path/)
    end

    it "should append the query string" do
      @gw.should_receive(:query_string).with(@t).and_return('qry=str')
      @gw.url(@t).should match(/^base\/path\?qry=str$/)
    end
  end

  describe "query_string" do
    it "should be specced"
  end

  describe "post" do
    it "should be specced"
  end
end
