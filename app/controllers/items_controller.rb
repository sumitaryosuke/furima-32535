class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :explanation, :area_id, :post_fee_id, :category_id, :post_day_id,
                                 :status_id).merge(user_id: current_user.id)
  end
end
