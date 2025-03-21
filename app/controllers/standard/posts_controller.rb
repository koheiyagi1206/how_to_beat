class Standard::PostsController < ApplicationController
  before_action :comment_many_order_sort

  def new
    @new_post = Post.new
  end

  def create
    @new_post         = Post.new(post_params)
    @new_post.user_id = current_user.id

    if @new_post.save
      @new_post_body      = PostBody.where(post_id: @new_post.id).order(id: :asc).includes(:image_body_blob)
      selected_post_body  = @new_post_body.find { |body| body.image_body.attached? }

      if selected_post_body
        @new_post.post_image.attach(selected_post_body.image_body.blob)
      end
      redirect_to post_path(@new_post)
    else
      render :new
    end
  end

  def index
    @all_posts = Post.all.order(updated_at: :desc).includes(post_bodies: :image_body_blob).page(params[:page]).per(6)
  end

  def show
    @target_post      = Post.find(params[:id])
    @target_post_body = PostBody.where(post_id: @target_post.id).includes(:image_body_blob)
  end

  def edit
    @target_post = Post.find(params[:id])
  end

  def update
    @target_post = Post.find(params[:id])

    if @target_post.update(post_params)

      # RemoveRowされたものをテーブルから削除
      if post_params[:post_bodies_attributes]
        post_params[:post_bodies_attributes].each do |key, value|
          if value["text"].nil? && value["image_title"].nil?
            target_record = PostBody.find(value["id"])
            if target_record.image_body.attached?
              target_record.image_body.purge
            end
            target_record.destroy
          end
        end
      end

      # サムネイル画像の再設定
      target_post_body    = PostBody.where(post_id: @target_post.id).order(id: :asc).includes(:image_body_blob)
      selected_post_body  = target_post_body.find { |body| body.image_body.attached? }

      if selected_post_body
        @target_post.post_image.attach(selected_post_body.image_body.blob)
      else
        file_path = Rails.root.join("app/assets/images/no_image.jpg")
        @target_post.post_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpg")
      end

      redirect_to post_path(@target_post)

    else
      render :edit
    end
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
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(
        :title,
        :post_image,
        post_bodies_attributes: [
          :id, :post_id, :text, :image_title, :image_body, :_destroy
        ]
      )
    end
end
