require 'spec_helper'

feature "Items" do
  before(:each) do
    @item = FactoryGirl.create(:item)
  end 
  
  scenario "should display items" do
    visit items_path
    page.should have_content("Fire And Ice Feuer")
  end

  scenario "should select Germany and display items from Germany" do
    @item.country = "DE"
    visit items_path
    find(:xpath, "//option[3]").click
    click_button "Save changes"
    page.should have_content("Fire And Ice Feuer")
  end
end