class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    if @item.purchase_record.nil? && current_user.id != @item.user_id
      @user_item = UserItem.new
    else
      redirect_to root_path
    end
  end

  def create
    @user_item = UserItem.new(user_item_params)
    if @user_item.valid?
      pay_item
      @user_item.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def user_item_params
    params.require(:user_item).permit(:postal_code, :prefecture, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: user_item_params[:token],
      currency: 'jpy'
    )
  end
end
