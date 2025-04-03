class HomeController < ApplicationController
  before_action :require_user_logged_in, only: [:create]

  def index
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
  end

  def profile
  end

  def create
  end

end
