class AddShokuiToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shokui, :string
  end
end
