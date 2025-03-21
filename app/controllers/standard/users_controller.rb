class Standard::UsersController < ApplicationController
  before_action :comment_many_order_sort

  def mypage
    @me       = User.find(current_user.id)
    @my_posts = Post.where(user_id: @me.id).order(updated_at: :desc).page(params[:page]).per(6)
  end

  def show
    @target_user  = User.find(params[:id])
    @target_posts = Post.where(user_id: @target_user.id).order(updated_at: :desc).page(params[:page]).per(6)
  end

  def edit
    @target_user = User.find(params[:id])
  end

  def update
    @target_user = User.find(params[:id])

    if @target_user.update(user_params)
      redirect_to user_path(@target_user)
    else
      flash[:notice] = "Please Enter the User Name and E-Mail."
      render :edit
    end

  end

  def destroy
    target_user = User.find(params[:id])
    target_user.destroy
    redirect_to root_path, notice: "Thank You for Use This Site!"
  end

  private
    def user_params
      params.require(:user).permit(:user_name, :email)
    end

end
