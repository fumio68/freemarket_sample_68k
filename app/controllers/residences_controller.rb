class ResidencesController < ApplicationController

  def create
    if Residence.where(user_id: params[:user_id]).exists?
      Residence.update(residence_params)
      # binding.pry
    else
      @residence = Residence.new(residence_params)
      @residence.save!
      # binding.pry
    end
  end

  def show
    @parents = Category.order("id ASC").limit(13)
    @user = User.find(params[:user_id])
    if Residence.where(user_id: params[:user_id]).exists?
      @residence = Residence.find_by(user_id: params[:user_id])
    else
      @residence = Residence.new()
    end
  end

  private
  def residence_params
    params.require(:residence).permit(:family_name, :last_name, :j_family_name, :j_last_name, :postcode, :prefecture, :city, :block).merge(user_id: current_user.id)
  end
end
