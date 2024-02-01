class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(message_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:item).permit(:image, :item_name, :explanation, :price, :category_id, :charge_id, :region_id,
                                 :shipping_day_id, :status_id).merge(user_id: current_user.id)
  end
end
