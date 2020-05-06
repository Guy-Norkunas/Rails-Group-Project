class AddProfilepicToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :pic_id, :integer
  end
end
