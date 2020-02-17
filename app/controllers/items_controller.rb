class ItemsController < ApplicationController
  def index
    @items = Item.all
    @user = User.find(1)
  end
  def create
  end
  def show
  end
end
