class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @all_posts = Post.all.page(params[:page]).per(10)
  end

  def destroy
    target_post       = Post.find(params[:id])
    target_post_body  = PostBody.where(post_id: target_post.id).includes(:image_body_blob)

    target_post_body.each do |target_p_body|
      if target_p_body.image_body.attached?
        target_p_body.image_body.purge
      end
    end

    target_post.post_image.purge
    target_post.destroy
    flash[:notice] = "Post : " + target_post.title.to_s + " is Deleted."
    redirect_to admin_posts_path
  end

end
