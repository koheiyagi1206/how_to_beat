class Standard::HomesController < ApplicationController

  def top
    @new_arrivals_posts     = Post.order(updated_at: :desc).limit(6).includes(:post_image_blob)
    @new_arrivals_comments  = Comment.order(updated_at: :desc).includes(:user, :post)

    @sorted_post = comment_many_order_sort
  end

  def about
  end

end
