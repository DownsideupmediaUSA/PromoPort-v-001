class Song < ApplicationRecord
  belongs_to :genre
  belongs_to :artist
  has_many :comments
  
end
