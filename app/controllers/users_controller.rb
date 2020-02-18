class UsersController < ApplicationController
  def index
  end
  def show
    # @user = User.find(params[:id])
    @parents = Category.order("id ASC").limit(13)
  end
end
