class CreateBlogposts < ActiveRecord::Migration[7.0]
  def change
    create_table :blogposts do |t|
      t.string :title
      t.string :description
      t.string :category
      t.references :blogger, null: false, foreign_key: true

      t.timestamps
    end
  end
end
