class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  after_action :verify_authorized, except: [:index, :show]


  def new
    @artist = Artist.new
    authorize Artist
  end

  def create
    #creates and saves a new artist.
    @artist = Artist.new(artist_params)
    #authorizes(admin) new artist
    authorize @artist
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

  end


  private

  def set_artist
    #search for track- callback
    @artist = Artist.find(params[:id])
    # authorize @song
  end

  def artist_params
    params.require(:artist).permit(:artist_name)
  end


end
