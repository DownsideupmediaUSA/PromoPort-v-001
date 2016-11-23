class ArtistsController < ApplicationController

 # before_action :only_admins?


  def create
    @artist = Artist.new(artist_params)
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
    @artist = Artist.find_by(params[:artist_id])
    @songs = Song.all
  end


  def new
    @artist = Artist.new
  end

  def songs_index
    @artist = Artist.find(params[:id])
    @songs = @artist.songs
    render template: 'songs/index'
  end

  def song
    @artist = Artist.find(params[:id])
    @song = Song.find(params[:id])
    render template: 'songs/show'
  end



  private

  def artist_params
    params.require(:artist).permit(:artist_name)
  end


end
