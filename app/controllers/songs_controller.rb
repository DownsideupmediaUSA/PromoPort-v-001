class SongsController < ApplicationController


  # displays a list of all instances of a song.
  def index
    @songs = Song.all
  end

  # displays an instance of a song found via its song id.
    def show
      @song = Song.find_by(params[:song_id])
      # comment = Song.comment
      # @artist = Artist.find_by(params[:artist_id])
    end
# displays a form to create a new song
  def new
    @song = Song.new
  end
# creates new instance of song with info provided from above form
# redirects user to list of all songs via index path.
  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:success] = "You have successfully created a new track!"
      redirect_to songs_url
    else
      flash[:alert] = "Oops...your track was not saved."
    end
  end

 #sends form to edit song (admin only sort out cancan)
  def edit
  end

  # displays a list of all instances of a song.
  def index
    @songs = Song.all
  end
#updates song info via submitted edit form (admin only sort out cancan)
  def update
  respond_to do |format|
    if @song.update(song_params)
      format.html { redirect_to @song, notice: 'Song was successfully updated.' }
    else
      format.html { render :edit }
    end
  end
end

def destroy
  authorize @song
  @song.destroy
  redirect_to songs_url, notice: 'Song was successfully destroyed.'
end



  private

  def song_params
    params.require(:song).permit(:title ,:genre, :artist_id, artist_attributes: [:artist_name])
  end




end
