class Order < ApplicationRecord
  belongs_to :item
  has_one :buyer_address
end
