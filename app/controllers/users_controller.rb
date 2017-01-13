class UsersController < ApplicationController

  def show
    @songs = Song.paginate(:page => params[:page], :per_page => 1)
  end
end
