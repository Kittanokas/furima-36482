class BuyerAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  #validates :postal_code, presence: true
  #validates :city, presence: true
  #validates :house_num, presence: true
  #validates :phone, presence: true
  belongs_to :order
end
