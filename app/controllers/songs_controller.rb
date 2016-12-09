class SongsController < ApplicationController
  #authenticates user prior to executing any action
  before_action :authenticate_user!
  #2 after actions to ensure that authorization methods have been called for the current request:
  # after_action :verify_authorized, except: [:index, :show]
  #prior to call, will set all applicapble methods according to this private callback
  before_action :set_song, only: [:show, :edit, :update, :destroy]




  # displays a list of all instances of a song.
  def index
    @songs = Song.all
    @artist = @song.artist
  end

  # displays an instance of a song found via its song id.
    def show
  
      @artist = @song.artist
      @genre = @song.genre
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
      redirect_to @song
    else
      flash[:alert] = "Oops...your track was not saved."
    end
  end

 #sends form to edit song (admin only  )
  def edit
  end

  # displays a list of all instances of a song.
  def index
    @songs = Song.all
  end
#updates song info via submitted edit form (admin only )
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

  @song.destroy
  redirect_to songs_url, notice: 'Song was successfully destroyed.'
end



  private

  def set_song
    #search for track- callback
    @song = Song.find(params[:id])
    # authorize @song
  end

  def song_params
    params.require(:song).permit(:title ,:genre_id, :artist_id, genre_attributes: [:genre_name], artist_attributes: [:artist_name])
  end




end
