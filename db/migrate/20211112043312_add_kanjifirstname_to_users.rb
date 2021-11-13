class AddKanjifirstnameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :Kanji_first_name, :string
  end
end
