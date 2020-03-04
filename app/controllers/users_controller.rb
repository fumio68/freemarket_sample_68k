class UsersController < ApplicationController
  before_action :move_to_login, only:[:index, :show]
  def index
  end
  def show

    session[:item_id] = nil
    
  end

  private
  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
