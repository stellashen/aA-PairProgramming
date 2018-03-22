class PostsController < ApplicationController
  before_action :require_log_in!, only: [:new, :create, :edit, :update, :destroy]
  def new
    @post = Post.new
    @post.sub_id = params[:sub_id]
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.sub_id = params[:sub_id]

    # params[:sub_ids].each do

    if @post.save
      redirect_to sub_url(@post.sub)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to sub_url(@post.sub)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to user_url(@post.author)
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [] )
  end
end
