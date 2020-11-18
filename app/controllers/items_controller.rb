class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :create]

  def index
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

  private

  def item_params
    params.require(:item).permit(:image, :name, :condition_id, :price, :category_id, :delivery_price_id, 
                                 :shipment_source_id, :information, :days_to_ship_id ).merge(user_id: current_user.id)
  end

end
