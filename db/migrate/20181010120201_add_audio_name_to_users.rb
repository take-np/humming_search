class AddAudioNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :audio_name, :string
  end
end
