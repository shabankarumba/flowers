require 'spec_helper'

feature "Items" do
  let(:item) { FactoryGirl.create(:item) }

  it "should filter by country" do
    Item.country("GB").should == [item]
  end

  it "should order items in asending order of price" do
   @item1 =  FactoryGirl.create(:item, :price => 9.99)
   @item2 =  FactoryGirl.create(:item,:title => "prince", :price => 8.50)
   Item.lowest_to_highest.should == [@item2, @item1]
  end

  it "should reject items with missing titles" do
    @item = FactoryGirl.build(:item, :title => "")
    @item.should_not be_valid
  end

  it "should reject non unique titles" do
    item.title = "Fire And Ice Feuer"
    @item2 =  FactoryGirl.build(:item)
    @item2.should_not be_valid
  end
end