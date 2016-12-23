class CommentsController < ApplicationController
  before_action :find_song

  def index
    @comments = @song.comments
    respond_to do |format|
      format.html {render 'index.html', :layout => false}
      format.js {render 'index.js', :layout => false}
    end
  end


  def create
   @comment = @song.comments.create(comment_params)
   @comment.user_id = current_user.id
   username = current_user.username
   @comment.save
   if @comment.save
     redirect_to song_path(@song)
   else
     render 'new'
   end
  end


  def show
    @comment = Comment.where(song_id: @song).order("created_at DESC")
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
