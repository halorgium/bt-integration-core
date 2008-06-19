require File.join(File.dirname(__FILE__), 'spec_helper')

class TestGroupedAccessor
  extend GroupedAccessor
  grouped_accessor :attributes, :attribute
  grouped_accessor :professions, :teacher, :programmer
  grouped_accessor :words, :ccnumber => :card_number
end
class Test2 < TestGroupedAccessor
  grouped_accessor :attributes, :other
end

describe GroupedAccessor, '.grouped_accessor' do
  before(:each) do
    @obj = TestGroupedAccessor.new
    @child = Test2.new
  end
  it "should create readers" do
    lambda {@obj.attribute}.should_not raise_error
  end
  it "should create writers" do
    @obj.attribute = :h4x0rz
    @obj.attribute.should == :h4x0rz
  end
  it "should accumulate names in variable named after the group" do
    TestGroupedAccessor.instance_variable_get("@attributes_group_accessor").should == [:attribute]
  end
  it "should also work for more than one accessor" do
    TestGroupedAccessor.instance_variable_get("@professions_group_accessor").should == [:teacher, :programmer]
  end
  it "should provide accessors for the groups which return hashes" do
    @obj.attribute = 'hello'
    @obj.attributes.should == {:attribute => 'hello'}
  end
  it "should also do that for the multiple accessor" do
    @obj.programmer = 'h4x0rz'
    @obj.professions.should == {:programmer => 'h4x0rz', :teacher => nil}
  end
  it "should alias the accessor methods if the alias is provided" do
    @obj.card_number = 123
    @obj.card_number.should == 123
    @obj.ccnumber.should == 123
  end
  it "should provide ccnumber in the words hash" do
    @obj.words.should have_key(:ccnumber)
  end
  it "should not provide card_number in the words hash" do
    @obj.words.should_not have_key(:card_number)
  end
  it "subclasses should have parent accessors" do
    lambda {@child.attribute}.should_not raise_error
  end
  it "subclasses should have parent accumulators" do
    lambda {@child.attributes}.should_not raise_error
  end
  it "parent classes should not have child accessors" do
    lambda {@obj.other}.should raise_error(NoMethodError)
  end
  it "parent classes should not have child accumulaors" do
    @obj.attributes.should_not have_key(:other)
  end
end
