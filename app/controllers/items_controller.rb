class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  private

  def create
    Item.create(item_params)
    redirect_to '/'
  end

  def message_params
    params.require(:item).permit(:image)
  end
end
