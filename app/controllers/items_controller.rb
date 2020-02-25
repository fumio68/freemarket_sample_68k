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
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def destroy
    @parents = Category.order("id ASC").limit(13)
    @user = User.find(current_user.id)
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      if item.destroy
        # redirect_to item_path(item)
      else
        render :delete
      end
    end
  end

end
