class UsersController < ApplicationController
  def index
  end
  def show
    @user = User.find(current_user.id)
    @parents = Category.order("id ASC").limit(13)
  end
end
