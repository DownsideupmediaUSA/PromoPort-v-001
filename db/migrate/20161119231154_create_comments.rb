class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.string :name
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :song, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
