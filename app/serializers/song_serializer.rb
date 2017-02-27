class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :image

  belongs_to :artist
  has_many :comments
  

end
