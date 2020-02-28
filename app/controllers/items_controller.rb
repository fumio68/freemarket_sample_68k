class ItemsController < ApplicationController
  before_action :set_item, only:[:destroy, :show, :edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
    @item_images = ItemImage.all
    # @parents = Category.order("id ASC").limit(13)
  end
  def new
    if user_signed_in?
      @item = Item.new
      @item.item_images.new
    else
      redirect_to new_user_session_path
    end
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
    # binding.pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @parents = Category.order("id ASC").limit(13)
    @category_1 = Category.find_by(id: @item.category_id_1)
    @category_2 = Category.find_by(id: @item.category_id_2)
    @category_3 = Category.find_by(id: @item.category_id_3)
    @size = Category.find_by(id: @item.size_id)

  end

  def edit
    @category_2 = Category.find(@item. category_id_2) if @item.category_id_2
    @category_3 = Category.find(@item. category_id_3) if @item.category_id_3
    @size = Category.find(@item.size_id) if @item.size_id
  end

  def update
    if @item.update(item_edit_params)
      # binding.pry
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    # @parents = Category.order("id ASC").limit(13)
    @item.destroy
    render :delete unless @item.user_id == current_user.id && @item.destroy
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :content, :brand, :condition, :shipping, :shipping_area, :days_to_ship, :shipping_method, :status,:category_id_1,:category_id_2, :category_id_3, :size_id,  item_images_attributes: [:image]).merge(user_id: current_user.id).merge(status: 1).merge(category_id: params[:item][:category_id_3])
  end

  def item_edit_params
    params.require(:item).permit(:id, :category_id, :name, :price, :content, :brand, :condition, :shipping, :shipping_area, :days_to_ship, :shipping_method, :status,:category_id_1,:category_id_2, :category_id_3, :size_id,  item_images_attributes: [:image, :id]).merge(user_id: current_user.id).merge(status: 1).merge(category_id: params[:item][:category_id_3])
  end


end