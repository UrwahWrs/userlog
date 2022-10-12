class CreateFavoriteBlogposts < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_blogposts do |t|
      t.integer :blogpost_id
      t.integer :blogger_id

      t.timestamps
    end
  end
end
