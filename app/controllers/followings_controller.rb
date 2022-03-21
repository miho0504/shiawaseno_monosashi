class FollowingsController < ApplicationController
 def index
   @users = User.where.not(id: current_user.id)
   @user  = User.find_by(id: params[:name])
   @posts = Post.all.includes(:user).where(user_id: @users)
  end
end
