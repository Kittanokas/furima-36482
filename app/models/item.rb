class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } , presence: true
  validates :delivery_fee_id, numericality: { other_than: 1, message: "can't be blank" } , presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } , presence: true
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" } , presence: true
  validates :ship_day_id, numericality: { other_than: 1, message: "can't be blank" } , presence: true
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format:{with: /\A[0-9]+\z/}, presence: true
  has_one_attached :image
  belongs_to :prefecture
  belongs_to :status
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :ship_day
  #belongs_to :user
end
