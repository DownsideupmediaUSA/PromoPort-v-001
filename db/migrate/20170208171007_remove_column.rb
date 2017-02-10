class RemoveColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :songs, :release_id
      
  end
end
