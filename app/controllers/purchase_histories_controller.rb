class PurchaseHistoriesController < ApplicationController
  before_action :item_find, only: [:index, :create]
  
  def index
    @form_object = FormObject.new
  end

  def create
    @form_object = FormObject.new(purchase_history_params)
    if @form_object.valid?
      @form_object.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_history_params
    params.permit(:postal_code,:area_id,:municipality,:address,:building_name,:phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end