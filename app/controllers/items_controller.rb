class ItemsController < ApplicationController
  def index
    # @user = User.find(1)
  end
  def create
  end
  def show
    @item = Item.find(params[:id]) 
  end
end
