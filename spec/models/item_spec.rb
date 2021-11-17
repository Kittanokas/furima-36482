require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

describe '商品の出品' do
  context '商品の出品ができる場合' do
    it '商品画像と説明文、価格を記述し出品できる' do
      expect(@item).to be_valid
    end
  end
  context '商品の出品ができない場合' do
    it '商品画像が空では投稿できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空では投稿できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品説明が空では投稿できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'カテゴリーが空では投稿できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品状態が空では投稿できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it '配送料の負担情報が空では投稿できない' do
      @item.delivery_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end
    it '発送元地域情報が空では投稿できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '発送までの日数情報が空では投稿できない' do
      @item.ship_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship day can't be blank")
    end
    it '商品価格が空では投稿できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格に半角数字以外が含まれている場合は出品できない' do
      @item.price = '1000a'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it '価格が300円未満では出品できない' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it '価格が9,999,999円を超えると出品できない' do
        @item.price = 99999999 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it 'カテゴリーに「---」が選択されている場合は出品できない' do
      @item.category_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態に「---」が選択されている場合は出品できない' do
      @item.status_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it '発送料の負担に「---」が選択されている場合は出品できない' do
      @item.delivery_fee_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end
    it '発送元の地域に「---」が選択されている場合は出品できない' do
      @item.prefecture_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '発送までの日数に「---」が選択されている場合は出品できない' do
      @item.ship_day_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship day can't be blank")
    end
    it 'userが紐付いていないと保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
end