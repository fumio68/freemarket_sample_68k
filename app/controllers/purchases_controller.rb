class PurchasesController < ApplicationController
  def index
  end
  def create

  end
  def show
    # @residence = Residence.find(current_user.id)
    if !(Residence.where(id: 2).blank?)
      @residence = Residence.find(2)
    else
      @residence = Residence.new()
    end
  end
end
