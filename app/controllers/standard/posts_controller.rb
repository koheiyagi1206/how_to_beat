class Standard::PostsController < ApplicationController
  before_action :comment_many_order_sort

  def new
    @new_post = Post.new
  end

  def create
    @new_post         = Post.new(post_params)
    @new_post.user_id = current_user.id

    if @new_post.save
      @new_post_body = PostBody.where(post_id: @new_post.id).order(id: :asc)

      @new_post_body.each do |new_p_body|
        if new_p_body.image_body.attached?
          @new_post.post_image.attach(new_p_body.image_body.blob)
        end
      end

      redirect_to post_path(@new_post)
    else
      render :new
    end
  end

  def index
    @all_posts = Post.all
  end

  def show
    @target_post      = Post.find(params[:id])
    @target_post_body = PostBody.where(post_id: @target_post.id)
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
