class CreateUsersPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :users_posts do |t|
<<<<<<< HEAD:db/migrate/20200505092511_create_users_posts.rb
      
=======
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
>>>>>>> 0e1fb94f87cb8078cfe62bccb563d53a8374fe0e:db/migrate/20200505095506_create_users_posts.rb

      t.timestamps
    end
  end
end
