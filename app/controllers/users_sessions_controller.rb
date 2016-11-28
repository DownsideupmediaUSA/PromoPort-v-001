class Users::SessionsController < Devise::SessionsController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @message = params[:message] if params[:message]
    @message ||= false
  end

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to user_path(@user), notice: "Welcome to Promo-Port!" }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    session[:user_id].delete
    redirect_to new_user_session_path
  end
  

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :admin
      )
    end

end
