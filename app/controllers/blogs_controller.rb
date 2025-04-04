class BlogsController < ApplicationController
  before_action :require_user_logged_in, only: [:new]

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
    end
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

  private 


  def blog_params
    params.require(:blog).permit(:title, :content, :image_url)
  end

end
