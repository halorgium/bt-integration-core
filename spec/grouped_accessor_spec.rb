require File.join(File.dirname(__FILE__), 'spec_helper')

class TestGroupedAccessor
  extend GroupedAccessor
  grouped_accessor :attributes, :attribute
  grouped_accessor :professions, :teacher, :programmer
  grouped_accessor :words, :ccnumber => :card_number

  def class_var_attrs
    @@attributes_group_accessor
  end
  def class_var_profs
    @@professions_group_accessor
  end
end

describe GroupedAccessor, '.grouped_accessor' do
  before(:each) do
    @obj = TestGroupedAccessor.new
  end
  it "should create readers" do
    lambda {@obj.attribute}.should_not raise_error
  end
  it "should create writers" do
    @obj.attribute = :h4x0rz
    @obj.attribute.should == :h4x0rz
  end
  it "should accumulate names in variable named after the group" do
    @obj.class_var_attrs.should == [:attribute]
  end
  it "should also work for more than one accessor" do
    @obj.class_var_profs.should == [:teacher, :programmer]
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
end
