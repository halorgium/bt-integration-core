require File.join(File.dirname(__FILE__), 'spec_helper')

describe Braintree::Query, "initialize" do
  it "should set url_path" do
    Braintree::Query.new.path.should == Braintree::Query::URL_PATH
  end
end
