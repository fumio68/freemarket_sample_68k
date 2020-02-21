class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
    @item_images = ItemImage.all
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    @parents = Category.order("id ASC").limit(13)
  end
  def create
  end
  def show
    @item = Item.find(params[:id]) 
    @parents = Category.order("id ASC").limit(13)
  end
end
