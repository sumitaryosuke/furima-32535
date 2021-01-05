class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to action: :index unless user_signed_in? && (current_user.id == @item.user_id)
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to edit_item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :explanation, :area_id, :post_fee_id, :category_id, :post_day_id,
                                 :status_id).merge(user_id: current_user.id)
  end
end
