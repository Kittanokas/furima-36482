class Order < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :token
  validates :price, presence: true
  validates :token, presence: true
  belongs_to :item
  has_one :buyer_address
end
