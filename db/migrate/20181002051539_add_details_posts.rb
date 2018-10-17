class AddDetailsPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    add_column :posts, :record_name, :string
    add_column :posts, :parenet, :integer
    add_column :posts, :thread, :integer
  end
end
