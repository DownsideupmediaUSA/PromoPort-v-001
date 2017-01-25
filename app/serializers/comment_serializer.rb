class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user

  belongs_to :song, serializer: SongSerializer


end
