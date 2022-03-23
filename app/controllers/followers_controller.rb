class FollowersController < ApplicationController
  def index
    @post = Post.where(id: params[:id])
    @user = User.where(id: params[:id])
  end
end
