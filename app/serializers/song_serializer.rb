class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist, :comments

  belongs_to :artist
  has_many :comments

end
