class SongsController < ApplicationController
  load_and_authorize_resource
  #authenticates user prior to executing any action

  #2 after actions to ensure that authorization methods have been called for the current request:
  # after_action :verify_authorized, except: [:index, :show]
  #prior to call, will set all applicapble methods according to this private callback
  before_action :set_song, only: [:edit, :update, :destroy, :show]


  # displays a list of all instances of a song.
  def index

    if params[:artist_id]
      @songs = Artist.find_by(params[:artist_id]).songs
    else
      @songs = Song.all
    end
    # @songs = Song.all
    # @artist = @song.artists
  end

  # displays an instance of a song found via its song id.
    def show
      if params[:artist_id]
      @artist = Artist.find_by(id: params[:artist_id])
      @song = @artist.songs.find_by(id: params[:id])
      @release = Release.find_by(params[:release_id])
      @comments = @post.comments
      @comment = @song.comments.build
      if @song.nil?
        redirect_to artist_songs_path(@artist), alert: "Song not found"
      end
    else
      @song = Song.find(params[:id])
    end
    end

# displays a form to create a new song
  def new
    @artist = Artist.find_by(params[:artist_id])
    @song = Song.new
  end

# creates new instance of song with info provided from above form
# redirects user to list of all songs via index path.
  def create
    @release = Release.find_or_create_by(params[:release_id])
    @artist = Artist.find_by(params[:artist_id])
    @song = Song.new(song_params)
    @song.save
    # if @song.save
    #   format.html { redirect_to @song, notice: 'Your track was created!' }
    #   format.json { render :show, status: :created, location: @song }
    # else
    #   format.html { render :new }
    #   format.json { render json: @song, notice: 'Opps something went arye.' }
    #   end
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
      format.html { redirect_to @song }
      format.json { render :show, status: :created, location: @song }
    else
      format.html { render :new }
      format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    @song.destroy
    redirect_to songs_url, notice: 'Song was successfully destroyed.'
  end

  private

  def set_song

    @song = Song.find_by(params[:song_id])
    # authorize @song
  end

  def song_params
    params.require(:song).permit(:title ,:genre_id, :artist_id, :release_id, releases_attributes: [:release_name])
  end




end
