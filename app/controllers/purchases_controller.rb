class PurchasesController < ApplicationController
  def index
    @itemId = params[:item_id]
    @purchaseId = params[:id]
    if current_user.residence.present?
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
    # @parents = Category.order("id ASC").limit(13)
    @itemId = params[:item_id]
    @user = current_user
    if current_user.residence.present?
      @residence = Residence.find_by(user_id: current_user.id)
    else
      @residence = Residence.new()
    end
  end

  def post_purchase_modify
    if current_user.residence.present?
      target = Residence.where(user_id: current_user.id)
      current_user.update(residence_id: target[0].id)
      redirect_to item_purchases_path(item_id: params[:item_id])
    else
      @residence = Residence.new(residence_params)
      @residence.save!
      current_user.update(residence_id: @residence.id)
      redirect_to item_purchases_path(item_id: params[:item_id])
    end
  end

  private
  def residence_params
    params.require(:residence).permit(:family_name, :last_name, :j_family_name, :j_last_name, :postcode, :prefecture, :city, :block).merge(user_id: current_user.id)
  end
  def done
  end
end
