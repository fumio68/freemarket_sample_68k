class UsersController < ApplicationController
  def index
  end
  def show

    session[:item_id] = nil
    
  end
end
