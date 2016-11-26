class Song < ApplicationRecord
  belongs_to :genre
  belongs_to :artist
  has_many :comments
  has_many :users, through: :comments
end
