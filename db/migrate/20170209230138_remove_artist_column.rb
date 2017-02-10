class RemoveArtistColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :song_releases, :artist_id
  end
end
