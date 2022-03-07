class RelationshipsController < ApplicationController

  def create
    @user = User.find_by(id: params[:relationship][:following_id])
    # ログインユーザーがフォローする
    current_user.follow!(@user)
    redirect_to users_path
  end

  def destroy
    @user = Relationship.find(params[:id]).following
    current_user.unfollow!(@user)
    redirect_to users_path
  end
end

