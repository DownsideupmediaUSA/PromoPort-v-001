class CreateSongReleases < ActiveRecord::Migration[5.0]
  def change
    create_table :song_releases do |t|
      t.belongs_to :song, index: true, foreign_key: true
      t.belongs_to :artist, index: true, foreign_key: true
      t.belongs_to :release, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
