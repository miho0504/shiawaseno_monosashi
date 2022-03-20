class FollowersController < ApplicationController
  def index
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: params[:id])
  end
  
  def show
    @users = User.where.not(id: current_user.id)
    @user  = User.find_by(id: params[:name])
    @posts = Post.all.includes(:user).where(user_id: @users)
  end
end
