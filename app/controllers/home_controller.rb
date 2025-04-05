class HomeController < ApplicationController

  def index
    if session[:user_id]
      if params[:query].present?
        @blogs = Blog.active.search_blogs(params[:query]).page(params[:page]).per(6)
      else
        @blogs = Blog.active.page(params[:page]).per(6)
      end
    end
  end

  def profile
  end

end
