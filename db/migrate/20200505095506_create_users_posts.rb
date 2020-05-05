class CreateUsersPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :users_posts do |t|
      t.timestamps
    end
  end
end
