class StaticPagesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to :controller=> 'dashboard', :action => 'show'
    else
      render 'static_pages/home'
    end
  end
end
