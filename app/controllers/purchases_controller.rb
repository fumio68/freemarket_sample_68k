class PurchasesController < ApplicationController
  require 'payjp'

  before_action :set_item
  before_action :set_card

  def index
    @itemId = params[:item_id]
    session[:item_id] = params[:item_id]
    @purchaseId = params[:id]
    if current_user.residence.present?
      @residence = Residence.find_by(user_id: current_user.id)
    else
      @residence = Residence.new
    end

    card = set_card
    if card.blank?

    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      @default_card_brand = @default_card_information.brand      
      case @default_card_brand
      when "Visa"
        @default_card_src = "visa.png"
      when "JCB"
        @default_card_src = "jcb.png"
      when "MasterCard"
        @default_card_src = "master.png"
      when "American Express"
        @default_card_src = "american.png"
      when "Diners Club"
        @default_card_src = "dinersclub.png"
      when "Discover"
        @default_card_src = "discover.png"
      end
    end
  end
  
  def pay
    card = set_card
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    Payjp::Charge.create(
    amount: @item.price, 
    customer: card.customer_id, 
    currency: 'jpy', 
    )
    redirect_to action: 'done'
  end

  def done
    @itemId = params[:item_id]
    @residence = Residence.find_by(user_id: current_user.id)
    @item.update(status: 0)
    card = set_card
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
    @default_card_brand = @default_card_information.brand      
    case @default_card_brand
    when "Visa"
      @default_card_src = "visa.png"
    when "JCB"
      @default_card_src = "jcb.png"
    when "MasterCard"
      @default_card_src = "master.png"
    when "American Express"
      @default_card_src = "american.png"
    when "Diners Club"
      @default_card_src = "dinersclub.png"
    when "Discover"
      @default_card_src = "discover.png"
    end
  end

  private
  def residence_params
    params.require(:residence).permit(:family_name, :last_name, :j_family_name, :j_last_name, :postcode, :prefecture, :city, :block).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_card
    Card.where(user_id: current_user.id).first
  end

end
