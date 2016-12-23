class Release < ApplicationRecord
  has_many :song_releases
  has_many :songs, through: :song_releases



end
