class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :content
      t.references :image, null: false, foreign_key: true
      t.timestamps
    end
  end
end
