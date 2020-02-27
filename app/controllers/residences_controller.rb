class ResidencesController < ApplicationController

  def create
    if Residence.where(user_id: current_user.id).exists?
      target = Residence.where(user_id: current_user.id)
      target.update(residence_params)
      if session[:item_id].nil?
        redirect_to user_residences_path(current_user.id)
      else
        redirect_to item_purchases_path(item_id: session[:item_id])
      end
    else
      @residence = Residence.new(residence_params)
      @residence.save!
      if session[:item_id].nil?
        redirect_to user_residences_path(current_user.id)
      else
        residect_to item_purchases_path(item_id: session[:item_id])
      end
    end
  end

  def index
    @parents = Category.order("id ASC").limit(13)

    @user = current_user
    if Residence.where(user_id: current_user.id).exists?
      @residence = Residence.find_by(user_id: current_user.id)
    else
      @residence = Residence.new()
    end
  end

  private
  def residence_params
    params.require(:residence).permit(:family_name, :last_name, :j_family_name, :j_last_name, :postcode, :prefecture, :city, :block).merge(user_id: current_user.id)
  end
end
