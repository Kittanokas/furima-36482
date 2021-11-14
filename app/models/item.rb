class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, :explanation, :price, :user, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
  has_one_attached :image
  belongs_to :prefecture
end
