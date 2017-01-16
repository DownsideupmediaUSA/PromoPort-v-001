class ReleasesController < ApplicationController

  def index
    @releases = Release.all
  end

  def show
    @release = Release.find_by(params[:release_id])
  end

  def new
    @release = Release.new
  end

  def create
    @release = Release.new(release_params)
    @release.save
    redirect_to new_song_path
  end

  private

  def release_params
    params.require(:release).permit(:release_name)
end

end
