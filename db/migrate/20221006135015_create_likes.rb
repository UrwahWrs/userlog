class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :blogger, null: false, foreign_key: true
      t.references :blogpost, null: false, foreign_key: true

      t.timestamps
    end
    add_index :likes, [:blogger_id, :blogpost_id], unique: true
  end
end
