class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :city, :house_num, :phone, :user_id
  
  with_options presence: true do
    validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }, presence: true
    validates :user_id
    validates :token
    validates :city
    validates :house_num
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone, format: {with: /\A(0{1}\d{9,10})\z/, message: "is invalid. Exclude hyphen(-)"}
  end

  def save
    order = Order.create(user_id: user_id)
    BuyerAddress.create(postal_code: postal_code, prefecture: prefecture, city: city, house_num: house_num, phone: phone, order_id: order.id)
  end
end
