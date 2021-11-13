class AddKanalastnameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :Kana_last_name, :string
  end
end
