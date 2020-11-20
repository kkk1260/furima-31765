class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :create, :edit]
  before_action :set_item, only: [:update, :edit, :show, :destroy]
  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to  root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to root_path 
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to action: :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :condition_id, :price, :category_id, :delivery_price_id, 
                                 :shipment_source_id, :information, :days_to_ship_id ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
