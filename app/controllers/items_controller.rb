class ItemsController < ApplicationController

  before_action :require_login, only: :new, alert: 'You need to sign in or sign up before continuing.'

  def index
    @items = Item.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
    private
  
    def require_login
      redirect_to user_session_path, alert: 'You need to sign in or sign up before continuing.' unless user_signed_in?
    end
  
    def item_params
      params.require(:item).permit(:image, :name, :explanation, :category_id, :commodity_condition_id, :shipping_charges_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
    end
  end

