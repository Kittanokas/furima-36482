class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :move_to_index, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
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
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
     redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :delivery_fee_id, :prefecture_id,
                                 :ship_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in? == current_user
      redirect_to action: :index
    end
  end

  def contributor_confirmation
    redirect_to root_path unless @current_user.id != params[:id].to_i
  end
  
end
