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
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  # 孫カテゴリーが選択された後に動くアクション
  def get_size
    @size = Category.find("#{params[:grandchild_id]}").children
    #選択された子カテゴリーに紐付くひ孫カテゴリーの配列を取得
    # category_grandchildren.each do |grandchild|
    #   @size = grandchild.children
    # end
    # binding.pry
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
