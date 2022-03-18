class RelationshipsController < ApplicationController

  def create
    @user = User.find_by(id: params[:relationship][:following_id])
    current_user.follow!(@user)
    redirect_to followers_path(@user)
  end

  def destroy
    @user = Relationship.find(params[:id]).following
    current_user.unfollow!(@user)
    redirect_to followers_path(@user)
  end
end

