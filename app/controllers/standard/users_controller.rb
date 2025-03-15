class Standard::UsersController < ApplicationController
  before_action :comment_many_order_sort

  def mypage
    @me       = User.find(current_user.id)
    @my_posts = Post.where(user_id: @me.id).order(updated_at: :desc).page(params[:page]).per(6)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
