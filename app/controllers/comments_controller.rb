class CommentsController < ApplicationController
  before_action :set_song
  def create
    # creates a new instance of a comment for that selected song
    @comment = Comment.new(comment_params)
    #saves instance
    @comment.save
    redirect_to song_comments_path(@song)
    # redirect_to song_path(@song)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def index
    @comments = @song.comments
    respond_to do |format|
      format.html {render 'index.html', :layout => false}
      format.js {render 'index.js', :layout => false}
    end
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
