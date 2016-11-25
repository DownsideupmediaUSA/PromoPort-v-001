class CommentsController < ApplicationController

  def create

    @song = Song.find_by(params[:song_id])
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to @song
  end

  def show
    @comment = Comment.find_by(params[:comment_id])
  end





  def index
    @comments = Comment.all
    @user = User.find_by(params[:user_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :song_id, :user_id, user_attributes:[:name])
  end



end
