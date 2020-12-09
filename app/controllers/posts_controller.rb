# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all

    respond_to do |format|
      format.json { render json: @posts }
      format.html { @posts }
    end
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.json { render json: @post }
      format.html { @post }
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to @post
    else
      redirect_to posts_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      redirect_to posts_path
    end
  end

  def destroy; end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
