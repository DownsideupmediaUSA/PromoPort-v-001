class CommentsController < ApplicationController
  before_action :set_song

  def index
    @comments = @song.comments
    respond_to do |format|
      format.html {render 'index.html', :layout => false}
      format.js {render 'index.js', :layout => false}
    end
  end


  def create
    binding.pry
    @comment = @song.comments.new


    if @comment.save
      # I need to render something that just has the LI I want...
      # why not just create a comments/show view that shows the LI of one comment?
      # render 'comments/show', :layout => false
      render 'create.js', :layout => false
    else
      render "songs/show"
    end
  end


  def show
    @comment = Comment.find(params[:id])
  end


  private

  def set_song
    # searches for song...
    @song = Song.find_by(params[:song_id])
  end

  def comment_params
      # sets paramaters for comment
    params.require(:comment).permit(:content)
  end



end
