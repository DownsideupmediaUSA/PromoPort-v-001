class CommentsController < ApplicationController

  def create
    @song = Song.find_by(params[:song_id])
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to song_path
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def index
    @comments = Comment.all
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :song_id, :user_id, user_attributes:[:username])
  end



end
