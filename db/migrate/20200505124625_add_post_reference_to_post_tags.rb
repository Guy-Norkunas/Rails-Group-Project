class AddPostReferenceToPostTags < ActiveRecord::Migration[6.0]
  def change
    add_reference :post_tags, :post, null: false, foreign_key: true
  end
end
