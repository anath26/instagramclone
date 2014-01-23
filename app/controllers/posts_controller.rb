class PostsController < ApplicationController

  before_action :fetch_post, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :update]
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :content, :image, :tag_names))

    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  def index
    @posts = Post.for_tag_or_all params[:tag_id]
    # if params[:tag_id]
    #   @posts = Tag.find(params[:tag_id]).posts
    # else
    #   @posts = Post.all
    # end

  end

  def edit
  end

  def update
    if @post.update(params[:post].permit(:title, :content, :image, :tag_names))
      redirect_to '/posts'
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to '/posts'
  end

  private

  def fetch_post
    @post = Post.find(params[:id])
  end
end
