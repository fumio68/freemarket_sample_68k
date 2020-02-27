class UsersController < ApplicationController
  def index
  end
  def show
    session[:item_id] = nil
    @parents = Category.order("id ASC").limit(13)
  end
end
