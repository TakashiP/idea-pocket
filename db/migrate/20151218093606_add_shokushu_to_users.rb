class AddShokushuToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shokushu, :string
  end
end
