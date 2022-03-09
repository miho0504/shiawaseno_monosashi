class FollowersController < ApplicationController
  def index
    @post = Post.all.where(id: params[:id])
    @user = User.all.where(id: params[:id])
  end
end
