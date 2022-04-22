class UsersController < ApplicationController
   before_action :search
   before_action :correct_user
  
  # 今日の友達の日記
  def index
    @users = User.where.not(id: current_user.id)
    @user  = User.find_by(id: params[:name])
    @posts = Post.all.includes(:user).where(user_id: @users)
  end

  # ユーザーのプロフィール
  def show
    unless user_signed_in?
    redirect_to user_session_path, alert: t('defaults.message.login')
    end
    @count_posts = current_user.posts.all.count
  end
  
  # 友達一覧ページ
  def friend_list
    @user = User.where.not(id: current_user.id)
    @users  = User.find_by(id: params[:name])
  end
  
  def search
    @q = User.ransack(params[:q])
  end
  
  private
  
  def correct_user
      @users = current_user
    unless @users
      redirect_to posts_path
    end
  end
end
