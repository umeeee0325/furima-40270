class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_find, only: [:index, :create]
  before_action :redirect_if_seller, only: [:index]
  before_action :redirect_if_sold_out, only: [:index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order = OrderResidence.new
  end

  def create
    @order = OrderResidence.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_residence).permit(:postal_code, :region_id, :city, :house_number, :building_name, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def redirect_if_seller
    if @item.user == current_user
      redirect_to root_path
    end
  end

  def redirect_if_sold_out
    if Order.exists?(item_id: params[:item_id])
      redirect_to root_path
    end
  end

end
