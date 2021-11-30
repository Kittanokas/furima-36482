class AddOrderIdToBuyerAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :buyer_addresses, :order_id, :integer
  end
end
