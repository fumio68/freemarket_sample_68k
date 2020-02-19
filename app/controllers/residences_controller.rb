class ResidencesController < ApplicationController

  def create
    residence = Residence.create(residence_params)
  end

  private
  def residence_params
    params.require(:residence).permit(:family_name, :last_name, :j_family_name, :j_last_name, :postcode, :prefecture, :city, :block)
  end
end
