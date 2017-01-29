class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist

  belongs_to :artist
  has_many :comments

end
