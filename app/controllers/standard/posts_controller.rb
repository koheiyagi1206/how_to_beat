class Standard::PostsController < ApplicationController
  before_action :comment_many_order_sort

  def new
    @new_post = Post.new
  end

  def create
    @new_post         = Post.new(post_params)
    @new_post.user_id = current_user.id

    if @new_post.save
      redirect_to post_path(@new_post)
    else
      render :new
    end
  end

  def index
    @all_posts = Post.all
  end

  def show
    @target_post = Post.find(params[:id])
  end

  def edit
    @target_post = Post.find(params[:id])
  end

  def update
    @target_post = Post.find(params[:id])

    if @target_post.update(post_params)
      redirect_to post_path(@target_post)
    else
      render :edit
    end
  end

  def destroy
    target_post = Post.find(params[:id])
    target_post.destroy
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(
        :title,
        :post_image,
        post_bodies_attributes: [
          :post_id, :text, :image_title, :image_body, :_destroy
        ]
      )
    end
end
