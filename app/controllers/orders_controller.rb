class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])

  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:token, :postal_code, :city, :house_num, :phone).merge(user_id: current_user.id)
  end
end
