class AddStatusToBlogpost < ActiveRecord::Migration[7.0]
  def change
    add_column :blogposts, :status, :string, default: 'private'
  end
end
