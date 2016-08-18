class AddCommentsToLikes < ActiveRecord::Migration[5.0]
  def change
    add_column :likes, :comment, :string
  end
end
