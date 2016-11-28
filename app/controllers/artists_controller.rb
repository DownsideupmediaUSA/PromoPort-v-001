class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def new
    @artist = Artist.new

  end

  def create
    #creates and saves a new artist.
    @artist = Artist.new(artist_params)
    #authorizes(admin) new artist

    if @artist.save
      flash[:success] = "You have successfully created an artist!"
      redirect_to artists_path
      else
        flash[:alert] = "Oops...your artist was not saved."
      end
  end

  def edit
  end

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end



  #
  # def songs_index
  #   @artist = Artist.find(params[:id])
  #   @songs = @artist.songs
  #   render template: 'songs/index'
  # end
  #
  # def song
  #   @artist = Artist.find(params[:id])
  #   @song = Song.find(params[:id])
  #   render template: 'songs/show'
  # end



  private

  def set_song
    #search for track- callback
    @song = Song.find(params[:id])
    # authorize @song
  end

  def artist_params
    params.require(:artist).permit(:artist_name)
  end


end
