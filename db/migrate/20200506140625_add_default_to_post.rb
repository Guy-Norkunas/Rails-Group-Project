class AddDefaultToPost < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :content, :string, default: ""
  end
end
