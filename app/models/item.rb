class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, :explanation, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :ship_day_id, :price, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
  has_one_attached :image
  belongs_to :prefecture, :status, :category, :delivery_fee, :ship_day
end
