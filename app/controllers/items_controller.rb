class ItemsController < ApplicationController

  before_action :require_login, only: :new, alert: 'You need to sign in or sign up before continuing.'
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :user_match?, only: [:edit, :destroy]

  def index
    @items = Item.order(id: 'DESC')
  end

  def user_match?
    redirect_to root_path if current_user != @item.user
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

  def show
    
  end

  def edit
    redirect_to root_path if current_user != @item.user|| Purchase.find_by(item_id: @item.id)
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render 'edit'
    end
  end

  def destroy
    if current_user.id == @item.user_id && @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end
  
    private
  
    def require_login
      redirect_to user_session_path, alert: 'You need to sign in or sign up before continuing.' unless user_signed_in?
    end
  
    def item_params
      params.require(:item).permit(:image, :name, :explanation, :category_id, :commodity_condition_id, :shipping_charges_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
    end


    def set_item
      @item = Item.find(params[:id])
    end
  end

