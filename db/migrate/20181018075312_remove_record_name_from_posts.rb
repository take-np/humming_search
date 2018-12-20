class RemoveRecordNameFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :record_name, :string
  end
end
