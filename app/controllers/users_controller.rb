class UsersController < ApplicationController
  def show
    
  end



  # def sign_out
  # session[:user_id].destroy
  # redirect_to new_user_session_path(user)
  # end

#   def create
#     @user = User.find_by(name: params[:user][:username])
#     if @user && @user.authenticate(params[:user][:password])
#     session[:user_id] = @user.id
#     redirect_to users_path(@user), notice: "Welcome back to the Undrgrnd"
#   else
#     redirect_to users_new_path, notice: "Please register to enter the Undrgrnd"
#   end
# end

  # def destroy
  #   session.delete :username
  #   redirect_to new_user_session_path
  # end
end
