class HomeController < ApplicationController

  def index
    if session[:user_id]
      @blogs = Blog.active
    end
  end

  def profile
  end

end
