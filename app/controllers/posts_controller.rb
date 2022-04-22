class PostsController < ApplicationController
    before_action :correct_user, only: [:edit, :update, :destroy, :show]

  def index
    @posts = Post.all
    @posts = Post.where(user_id: current_user.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post[:start_time] = DateTime.current
    if @post.save
      redirect_to posts_path, notice: t('defaults.message.created')
    else
      flash.now['alert'] = t('defaults.message.not_created')
      render :new
    end
  end

  def show
    respond_to do |format|
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end  
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path,  notice: t('defaults.message.update')
    else
      flash.now['alert'] = t('defaults.message.not_updated')
      render :edit
    end
  end
  
  def destroy
    @post.destroy!
    redirect_to posts_path, alert: t('defaults.message.deleted')
  end

  private
  
def correct_user
  @post = current_user.posts.find_by(id: params[:id])
  unless @post
    redirect_to posts_path
  end
end

  def post_params
    params.require(:post).permit(:content, :today_mood, :start_time)
  end
end
