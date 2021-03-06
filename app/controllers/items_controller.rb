class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :prevent_url, only: [:edit]
  def new
    @item = Item.new
  end

  def index
    @items = Item.all.order("created_at DESC")
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
      if current_user != @item.user
        redirect_to root_path
      end
     # redirect_to root_path unless current_user.id == @buy_item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user == @item.user
      @item.destroy
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :text, :name, :explanation, :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def prevent_url
    if @item.purchase_record != nil
      redirect_to root_path
    end
  end
end
