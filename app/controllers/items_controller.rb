class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    # Prototype.create(prototype_params)
    @item = Item.create(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end
  private

  def message_params
    params.require(:item).permit(:image, :name, :price, :explanation, :area_id, :post_fee_id, :category_id, :post_day_id, :status_id).merge(user_id: current_user.id)
  end

end

