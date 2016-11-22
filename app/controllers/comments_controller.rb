class CommentsController < ApplicationController

  def create
    @song = Song.find_by(params[:song_id])
    @comment = @song.comments.build(comment_params)
    @comment.save
    redirect_to @song
  end






  def index
    @comments = Comment.all
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :song_id, :username, :user_id, user_attributes:[:username])
  end



end
