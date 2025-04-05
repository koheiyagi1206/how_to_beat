class Standard::CommentsController < ApplicationController
  before_action :comment_many_order_sort, :authenticate_user!

  def create
    target_post = Post.find(params[:post_id])
    comment     = current_user.comments.new(comment_params)

    comment.post_id = target_post.id

    comment.save
    redirect_to post_path(target_post)
  end

  def destroy
    target_comment = Comment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end


  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
