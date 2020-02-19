class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
    @item_images = ItemImage.all
    @user = User.find(1)
    @parents = Category.order("id ASC").limit(13)
    # @user = User.find(1)
  end
  def new
    @item = Item.new
    @item.item_images.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :content, :brand, :condition, :shipping, :shipping_area, :days_to_ship, :shipping_method, :status,category_ids: [], item_images_attributes: [:image]).merge(user_id: current_user.id)
  end


end
