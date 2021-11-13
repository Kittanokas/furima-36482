class AddKanjilastnameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :Kanji_last_name, :string
  end
end
