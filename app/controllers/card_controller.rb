class CardController < ApplicationController

  require "payjp"

  before_action :set_card

  def new
    card = set_card
    redirect_to action: "index" if card.exists?
  end

  def pay
    card = set_card
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    if params['payjp-token'].blank?
      if session[:item_id].nil?
        redirect_to user_card_index_path(current_user.id)
      else
        redirect_to item_purchases_path(item_id: session[:item_id])
      end
    else
      customer = Payjp::Customer.create(
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      @card.save
      if session[:item_id].nil?
        redirect_to new_user_card_path(current_user.id)
      else
        redirect_to item_purchases_path(item_id: session[:item_id])
      end
    end
  end

  def delete 
    card = set_card.first
    if card.present?
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def index
    card = set_card.first
    if card.blank?
      redirect_to action: "new" 
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

  private

  def set_card
    Card.where(user_id: current_user.id)
  end

end
