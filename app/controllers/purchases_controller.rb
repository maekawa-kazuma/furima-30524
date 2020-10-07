class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  
  def index
    @item = Item.find(params[:item_id])
    item_checked = Purchase.find_by(item_id: params[:item_id])
    if current_user.id == @item.user_id || item_checked != nil
      return redirect_to root_path
    else
      @purchase_address = PurchaseAddress.new
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(token: params[:token], item_id: params[:item_id],user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_address_params[:token],
      currency: 'jpy'
    )
  end
end
