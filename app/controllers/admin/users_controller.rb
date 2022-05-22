class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path
  end
end
