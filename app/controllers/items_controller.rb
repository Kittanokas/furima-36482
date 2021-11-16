class ItemsController < ApplicationController
  def index
    @items = Item.all
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

  private
  def item_params
    params.require(:item).permit(:nickname, :Kanji_last_name, :Kanji_first_name, :Kana_first_name, :Kana_last_name, :birthday, :image)
  end
end