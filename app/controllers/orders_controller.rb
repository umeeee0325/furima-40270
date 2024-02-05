class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = OrderResidence.new
  end

  def create
    @order = OrderResidence.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_residence).permit(:postal_code, :region_id, :city, :house_number, :building_name, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
