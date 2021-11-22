class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:id])
    @order = Order.new
  end

  def create
    Order.create(order_params)
  end

  def save
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:order).permit(:)
end
