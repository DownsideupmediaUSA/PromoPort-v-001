class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :username
      t.integer :user_id
      t.integer :song_id
      
      t.timestamps null: false
    end
  end
end
