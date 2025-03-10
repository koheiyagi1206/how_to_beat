class Standard::HomesController < ApplicationController

  def top
    @new_arrivals_posts   = Post.order(updated_at: :desc)
    @new_arrivals_comments = Comment.order(updated_at: :desc).includes(:user, :post)
  end

  def about
  end

end
