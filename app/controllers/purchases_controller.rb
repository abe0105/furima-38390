class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find, only: [:index, :create]


  def index
    @purchase_address = PurchaseAddress.new
    redirect_to root_path if Purchase.find_by(item_id: @item.id) || @item.user == current_user
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
    pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(
      :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

    def item_find
      @item = Item.find(params[:item_id])
    end
  end