class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.references :user, index: true, foreign_key: true
      t.references :pocket, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
      t.index [:user_id, :created_at]
      t.index [:pocket_id, :created_at]
    end
  end
end
