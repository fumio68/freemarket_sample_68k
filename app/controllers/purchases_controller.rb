class PurchasesController < ApplicationController
  def index
    @itemId = params[:item_id]
    @purchaseId = params[:id]
    if Residence.where(user_id: current_user.id).present?
      @residence = Residence.find_by(user_id: current_user.id)
    else
      @residence = Residence.new
    end
  end
  def create

  end
  def show
    
  end

  def get_purchase_modify
    
    @parents = Category.order("id ASC").limit(13)
    @itemId = params[:item_id]
    @user = User.find(current_user.id)
    if Residence.where(user_id: current_user.id).exists?
      @residence = Residence.find_by(user_id: current_user.id)
    else
      @residence = Residence.new()
    end
  end

  def post_purchase_modify
    if Residence.where(user_id: current_user.id).exists?
      target = Residence.where(user_id: current_user.id)
      target.update(residence_params)
      redirect_to item_purchases_path(item_id: params[:item_id])
    else
      @residence = Residence.new(residence_params)
      @residence.save!
      redirect_to item_purchases_path(item_id: params[:item_id])
    end
  end

  private
  def residence_params
    params.require(:residence).permit(:family_name, :last_name, :j_family_name, :j_last_name, :postcode, :prefecture, :city, :block).merge(user_id: current_user.id)
  end
end
