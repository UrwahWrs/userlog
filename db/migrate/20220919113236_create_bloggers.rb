class CreateBloggers < ActiveRecord::Migration[7.0]
  def change
    create_table :bloggers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
