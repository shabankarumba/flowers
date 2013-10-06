class ItemsController < ApplicationController

  def index
    @items = Item.country(params[:country]).lowest_to_highest
  end
end