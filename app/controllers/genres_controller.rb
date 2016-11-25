class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to genres_path
  end

  def show
    @genre = Genre.find_by(params[:genre_id])
    @songs = Song.all

  end

  private




  def genre_params
    params.require(:genre).permit(:name)
  end

  end
