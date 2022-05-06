class UsersController < ApplicationController
   before_action :search
   before_action :correct_user
  
  def index;end

  # ユーザーのプロフィール
  def show
    unless user_signed_in?
    redirect_to user_session_path, alert: t('defaults.message.login')
    end
    @count_posts = current_user.posts.all.count
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
