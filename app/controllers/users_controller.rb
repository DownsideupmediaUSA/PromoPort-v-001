class UsersController < ApplicationController
  # def update
  #   @user = User.find(params[:id])
  #   @user.toggle!(:admin)
  #   flash[:success] = 'OK!'
  #   redirect_to root_path
  # end

  

  def show
    @songs = Song.paginate(:page => params[:page], :per_page => 3)
  end
end
