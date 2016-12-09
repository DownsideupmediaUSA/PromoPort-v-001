class CommentsController < ApplicationController

  def create
    # searches for song...
    @song = Song.find_by(params[:song_id])
    # creates a new instance of a comment for that selected song
    @comment = Comment.new(comment_params)
    #saves instance
    @comment.save
    redirect_to song_path(@song)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def index
    @comments = Comment.all
  end

  private

  def comment_params
      # sets paramaters for comment
    params.require(:comment).permit(:content, :song_id, :user_id, user_attributes:[:username])
  end



end
