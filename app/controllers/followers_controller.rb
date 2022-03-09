class FollowersController < ApplicationController
  def index
    @post = Post.all.where(id: params[:id])
  end
end
