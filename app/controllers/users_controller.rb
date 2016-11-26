class UsersController < ApplicationController
  def show
   
  end



  def create
    @user = User.find_by(name: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to users_path(@user), notice: "Welcome back to the Undrgrnd"
  else
    redirect_to users_new_path, notice: "Please register to enter the Undrgrnd"
  end
end

  def destroy
    session[:user_id].delete
    redirect_to new_user_session_path
  end
end
