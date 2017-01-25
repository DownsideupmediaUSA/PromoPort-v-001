class SongSerializer < ActiveModel::Serializer
  attributes :id, :title

  belongs_to :artist
  has_many :comments

end