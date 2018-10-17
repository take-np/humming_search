class AddDetailsUsers < ActiveRecord::Migration
  def change
    add_column :users, :password, :string
    add_column :users, :email, :string
    add_column :users, :image_name, :string
  end
end
