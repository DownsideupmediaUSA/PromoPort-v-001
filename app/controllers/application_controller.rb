class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  #sets the scope of the new session
  def new_session_path(scope)
    new_user_session_path
  end

  protected


  def configure_permitted_parameters
   added_attrs = [:admin, :username, :email, :password, :password_confirmation, :remember_me]
   devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
   devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  #raises a pundit not authorized error
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    flash[:error] = "Access denied"
    redirect_to(request.referrer || root_path)
  end








end
