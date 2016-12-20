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
   @comment.save

   if @comment.save
     redirect_to song_path(@song)
   else
     render 'new'
    end
  end


  def show
    @comment = Comment.find(params[:id])
  end


  private

  def find_song
    # searches for song...
    @song = Song.find_by(params[:song_id])
  end

  def comment_params
      # sets paramaters for comment
    params.require(:comment).permit(:content)
  end



end
