class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    session[:item_id] = params[:item_id]
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

  private
  def residence_params
    params.require(:residence).permit(:family_name, :last_name, :j_family_name, :j_last_name, :postcode, :prefecture, :city, :block).merge(user_id: current_user.id)
  end
  def done
  end
end
