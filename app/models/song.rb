class Song < ApplicationRecord
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  has_many :comments
  has_many :users, through: :comments
end
