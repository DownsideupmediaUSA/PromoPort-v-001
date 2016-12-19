class CommentsController < ApplicationController
  before_action :set_song
  def create
    @comment = @song.comments
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to song_url(@comment.song_id), notice: 'Comment was successfully created.'  }
        format.json { render action: 'show', status: :created, location: @comment}
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
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
    params.require(:comment).permit(:content)
  end



end
