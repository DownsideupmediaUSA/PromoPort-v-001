class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :song_id
      t.string :username

      t.timestamps null: false
    end
  end
end
