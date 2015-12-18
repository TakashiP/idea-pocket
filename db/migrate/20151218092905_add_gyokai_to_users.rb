class AddGyokaiToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gyokai, :string
  end
end
