class CommentsController < ApplicationController
  before_action :set_song, only: [:create, :show, :index]

  def create
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
    @comments = @song.comments
  end

  private

  def set_song
    # searches for song...
    @song = Song.find_by(params[:song_id])
  end

  def comment_params
      # sets paramaters for comment
    params.require(:comment).permit(:content, :song_id, :user_id, user_attributes:[:username])
  end



end
