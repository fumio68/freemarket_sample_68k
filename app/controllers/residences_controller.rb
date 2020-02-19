class ResidencesController < ApplicationController

  def create
    @residence = Residence.create(residence_params)
  end

  def show
    isExistResidence = Residence.find(params[:user_id])
    @parents = Category.order("id ASC").limit(13)
    @user = User.find(params[:user_id])
    if isExistResidence
      @residence = isExistResidence
    else
      @residence = Residence.new
    end
  end

  private
  def residence_params
    params.require(:residence).permit(:family_name, :last_name, :j_family_name, :j_last_name, :postcode, :prefecture, :city, :block)
  end
end
