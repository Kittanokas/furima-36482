class AddKanafirstnameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :Kana_first_name, :string
  end
end
