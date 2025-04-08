class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @all_users = User.all.page(params[:page]).per(10)
  end

  def destroy
    target_user = User.find(params[:id])
    target_user.destroy
    flash[:notice] = "User : " + target_user.user_name.to_s + " is Deleted."
    redirect_to admin_users_path
  end

end
