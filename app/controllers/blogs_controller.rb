class BlogsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :show, :edit]
  before_action :authorize_user, only: [:edit, :update, :delete]

  def new
    @blog = Blog.new
  end

  def create
    @blog = Current.user.blogs.build(blog_params)

    if @blog.save
      redirect_to root_path, notice: "New blog post successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @blog = Blog.find_by(id: params[:id])
    if @blog.nil?
      redirect_to root_path, alert: "Blog not found"
      return
    end
  
    # create a new comment model object
    @comment = Comment.new
  end
  

  def edit 
    @blog = Blog.find_by(id: params[:id])
  end

  def update
    @blog = Blog.find_by(id: params[:id])
    
    if @blog.update(blog_params) 
      redirect_to root_path, notice: "Blog details updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete 
    @blog = Blog.find_by(id: params[:id])
    if @blog.soft_delete
      redirect_to root_path, notice: "Blog post has been deleted"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def authorize_user
    @blog = Blog.find(params[:id])
    if @blog.user_id != session[:user_id]
      redirect_to root_path, alert: "You are not authorized to edit this blog."
    end
  end

  private 


  def blog_params
    params.require(:blog).permit(:title, :content, :image_url)
  end

end
