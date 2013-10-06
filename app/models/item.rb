class Item < ActiveRecord::Base
  attr_accessible :title, :price, :description, :currency, :image_link, :country
  validates :title, :presence => :true
  validates :title, :uniqueness => :true

  scope :lowest_to_highest, order("price ASC")
  scope :country,lambda {|country| where(:country => country)} 
end