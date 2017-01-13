class CommentsController < ApplicationController
  before_action :find_song

  def index
    @comments = @song.comments
# <<<<<<< Updated upstream
#     respond_to do |format|
#       format.html {render 'index.html', :layout => false}
#       format.js {render 'index.js', :layout => false}
#     end
# =======
    render 'comments/index', :layout => false
    # respond_to do |format|
    # format.html
    # format.json { render json: @comments.as_json(include: [:user]) }
    # format.json { render json: @comments }
    # end
# >>>>>>> Stashed changes
  end


  def create
   @comment = @song.comments.build(comment_params)
   @comment.user_id = current_user.id
   username = current_user.username
   if @comment.save
    #  redirect_to song_path(@song)
    render json: @comment
   else
    render 'songs/show'
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
