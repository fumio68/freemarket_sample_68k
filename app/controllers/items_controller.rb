class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
    @item_images = ItemImage.all
    @user = User.find(1)
  end
  def create
  end
  def show
  end

  
end
