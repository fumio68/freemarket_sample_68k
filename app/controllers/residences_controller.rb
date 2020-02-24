class ResidencesController < ApplicationController

  def create
    if Residence.where(user_id: current_user.id).exists?
      target = Residence.where(user_id: current_uesr.id)
      target.update(residence_params)
      redirect_back(fallback_location: root_path)
      # binding.pry
    else
      @residence = Residence.new(residence_params)
      @residence.save!
      redirect_back(fallback_location: root_path)
      # binding.pry
    end
  end

  def index
    @parents = Category.order("id ASC").limit(13)

    @user = User.find(current_user.id)
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
