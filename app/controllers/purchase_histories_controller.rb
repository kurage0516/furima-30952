class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :item_find, only: [:index, :create]
  before_action :contributor_confirmation, only: :index

  def index
    @form_object = FormObject.new
  end

  def create
    @form_object = FormObject.new(purchase_history_params)
    if @form_object.valid?
      pay_item
      @form_object.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_history_params
    params.require(:form_object).permit(:postal_code, :area_id, :municipality, :address, :building_name, :phone_number).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: item_find[:price],  
      card: purchase_history_params[:token], 
      currency: 'jpy'                 
    )
  end

  def contributor_confirmation
    redirect_to root_path if current_user == @item.user || @item.purchase_history.present?
  end
end
