class ArtistsController < ApplicationController

 before_action: only_admins?

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      flash[:success] = "You have successfully created an artist!"
      redirect_to @artist
      else
        flash[:alert] = "Oops...your artist was not saved."
      end
    end



    def show
      @artist = Artist.find_by(params[:id])
    end


  def edit
  end

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end



  private

  def artist_params
    params.require(:artist).permit(:artist_name)
  end


end
