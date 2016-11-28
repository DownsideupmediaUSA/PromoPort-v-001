class Artist < ApplicationRecord
  enum role: [:user, :admin]
  
  has_many :song_genres
  has_many :songs
  has_many :genres, through: :song_genres
  validates :artist_name, presence: true

end
