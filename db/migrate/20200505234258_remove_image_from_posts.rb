class RemoveImageFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_reference :posts, :image, null: false, foreign_key: true
  end
end
