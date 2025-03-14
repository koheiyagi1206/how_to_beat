class Standard::HomesController < ApplicationController
  before_action :comment_many_order_sort

  def top
    @new_arrivals_posts = Post.order(updated_at: :desc).limit(6).includes(:post_image_blob)
  end

  def about
  end

end
