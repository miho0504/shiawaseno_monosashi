class UsersController < ApplicationController
  
  # 友達一覧ページ
  def index
    @users = User.where.not(id: current_user.id)
    @user  = User.find_by(id: params[:name])
  end

  # ユーザーのプロフィール
  def show
    unless user_signed_in?
    redirect_to user_session_path, alert: t('defaults.message.login')
    end
  end
  
  # フォローの数
  def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
  end
  
  # フォロワーの数
  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
end
