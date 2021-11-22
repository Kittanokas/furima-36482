class CreateBuyerAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_addresses do |t|
      t.string          :postal_code,          null: false
      t.integer         :prefecture_id,        null: false
      t.string          :city,                 null: false
      t.string          :house_num,            null: false
      t.string          :building_name,        null: false
      t.string          :phone,                null: false
      t.timestamps
    end
  end
end
