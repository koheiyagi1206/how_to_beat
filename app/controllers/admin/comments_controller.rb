class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @all_comments = Comment.order(updated_at: :desc).includes(:user, :post).page(params[:page]).per(10)
  end

  def destroy
    target_comment = Comment.find(params[:id]).destroy
    redirect_to admin_comments_path
  end

end
