class Order < ApplicationRecord
  #validates :token, presence: true
  belongs_to :item
  has_one :buyer_address
end
