class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :prefecture_id, :postal_code, :city, :house_num, :phone, :user_id, :building_name, :item_id

  with_options presence: true do
    validates :user_id
    validates :token, presence: true
    validates :city, presence: true
    validates :house_num, presence: true
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は無効です。ハイフンを入れください。' }, presence: true
    validates :phone, format: { with: /\A(0{1}\d{9,10})\z/, message: 'は無効です。ハイフンを含めないでください。' }, presence: true
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    BuyerAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_num: house_num,
                        building_name: building_name, phone: phone, order_id: order.id)
  end
end
