class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?
  before_action :set_category

  def set_category 
    @parents = Category.order("id ASC").limit(13)
  end
  
  private

  def production?
    Rails.env.production?
  end
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  protected
  
  def configure_permitted_parameters
    added_attrs = [
      :nickname,              #ニックネーム
      :email,                 #email
      :password,              #パスワード
      :password_confirmation, #パスワード確認
      :family_name,           #姓
      :last_name,             #名
      :j_family_name,         #姓（カナ）
      :j_last_name,           #名（カナ）
      :b_year,                #生年月日（年）
      :b_month,               #生年月日（月）
      :b_date,                #生年月日（日）
      :user_image,            #ユーザー画像
    ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  

  
end
