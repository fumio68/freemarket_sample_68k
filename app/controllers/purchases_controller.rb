class PurchasesController < ApplicationController
  def index
  end
  def create

  end
  def show
    # @residence = Residence.find(current_user.id)
    if Residence.where(id: 1).exists?
      @residence = Residence.find(1)
    else
      @residence = Residence.new()
    end
  end
end
