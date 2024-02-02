class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy]
  before_action :set_item, only: [:show, :update, :edit, :destroy]

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
  end

  def edit
    if user_signed_in?
      unless current_user == @item.user
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path(@user)
    end
  end

  def update
    if @item.update(message_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.user == current_user
      @item.destroy
      redirect_to root_path
    else
      redirect_to item_path(@item), alert: 'You are not the owner of this item'
    end
  end

  private

  def message_params
    params.require(:item).permit(:image, :item_name, :explanation, :price, :category_id, :charge_id, :region_id,
                                 :shipping_day_id, :status_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
