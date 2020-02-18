class ItemsController < ApplicationController
  def index
    @parents = Category.order("id ASC").limit(13)
    # @user = User.find(1)
  end
  def create
  end
  def show
  end
end
