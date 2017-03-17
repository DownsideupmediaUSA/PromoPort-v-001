class CommentsController < ApplicationController
  before_action :find_song, only: [:show, :create]

  def index
    @comments = Comment.all
  end

  def api_index
   @comments = Comment.all
   render json: @songs
  end

  def new
    @comment = Comment.new
  end

  def create
   @comment = @song.comments.new(comment_params)
   @comment.user_id = current_user.id
   username = current_user.username
   if @comment.save
    render 'create.js', :layout => false
   else
     render "songs/show"
   end
  end

  def show
    @comment = @song.comments.find(params[:id])
  end







  private

  def find_song
    # searches for song...
    @song = Song.find(params[:song_id])
  end

  def comment_params
      # sets paramaters for comment
    params.require(:comment).permit(:content)
  end



end
