class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate_user!

  def new_session_path(scope)
    new_user_session_path
  end







end
