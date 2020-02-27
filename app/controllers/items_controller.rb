class ItemsController < ApplicationController
  before_action :set_item, only:[:destroy, :show, :edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
    @item_images = ItemImage.all
    @parents = Category.order("id ASC").limit(13)
  end
  def new
    @item = Item.new
    @item.item_images.new
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
  end

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def get_size
    #選択された子カテゴリーに紐付くひ孫カテゴリーの配列を取得
    @size = Category.find("#{params[:grandchild_id]}").children
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
    @item = Item.find(params[:id])
    @parents = Category.order("id ASC").limit(13)
  end

  def edit
    @category_2 = Category.find(@item. category_id_2) if @item.category_id_2
    @category_3 = Category.find(@item. category_id_3) if @item.category_id_3
    @size = Category.find(@item.size_id) if @item.size_id
  end

  def update
    # binding.pry
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @parents = Category.order("id ASC").limit(13)
    @item.destroy
    render :delete unless @item.user_id == current_user.id && @item.destroy
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :content, :brand, :condition, :shipping, :shipping_area, :days_to_ship, :shipping_method, :status,:category_id_1,:category_id_2, :category_id_3, :size_id, item_images_attributes: [:image]).merge(user_id: current_user.id).merge(status: 1).merge(category_id: params[:item][:category_id_3])
  end

end