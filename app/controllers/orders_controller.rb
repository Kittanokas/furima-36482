class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    redirect_to root_path unless user_signed_in? && current_user.id == @order_address.user_id
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, 
        card: order_params[:token],   
        currency: 'jpy'      
      )
      @order_address.save
      return redirect_to root_path 
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:prefecture_id, :postal_code, :city, :house_num, :phone, :building_name).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end
end
