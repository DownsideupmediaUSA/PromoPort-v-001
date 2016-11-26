class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
    t.string :title
    t.integer :artist_id
    t.integer :genre_id
    t.string :genre_name
    t.string :artist_name

    t.timestamps null: false
    end
  end
end
