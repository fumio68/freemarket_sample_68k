class ResidencesController < ApplicationController

  def create
    @residence = Residence.create(residence_params)
  end

  def show
    @parents = Category.order("id ASC").limit(13)
    @user = User.find(current_user.id)
    if Residence.where(user_id: current_user.id).exists?
      @residence = Residence.find(current_user.id)
    else
      @residence = Residence.new()
    end
  end

  private
  def residence_params
    params.require(:residence).permit(:family_name, :last_name, :j_family_name, :j_last_name, :postcode, :prefecture, :city, :block)
  end
end
