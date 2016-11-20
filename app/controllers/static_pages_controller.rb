class StaticPagesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to :controller=> 'dashboard', :action => 'index'
    else
      render 'static_pages/index'
    end
  end
end
