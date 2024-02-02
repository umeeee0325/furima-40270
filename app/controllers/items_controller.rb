class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @item = Item.order('created_at DESC')
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    if user_signed_in?
      @item = Item.find(params[:id])
      unless current_user == @item.user
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path(@user)
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(message_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:item).permit(:image, :item_name, :explanation, :price, :category_id, :charge_id, :region_id,
                                 :shipping_day_id, :status_id).merge(user_id: current_user.id)
  end
end
