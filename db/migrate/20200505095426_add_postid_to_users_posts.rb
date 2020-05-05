class AddPostidToUsersPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :users_posts, :post, null: false, foreign_key: true
    add_reference :users_posts, :user, null: false, foreign_key: true
  end
end
