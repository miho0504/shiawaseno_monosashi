class PostsController < ApplicationController
  
  def index
    @posts = Post.all
    @posts = Post.where(user_id: current_user.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post[:start_time] = Date.today.strftime('%Y-%m-%d')
    if @post.save
      redirect_to posts_path, notice: t('defaults.message.created')
    else
      flash.now['alert'] = t('defaults.message.not_created')
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path,  notice: t('defaults.message.update')
    else
      flash.now['alert'] = t('defaults.message.not_updated')
      render :edit
    end
  end
  
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to posts_path, alert: t('defaults.message.deleted')
  end

  private

  def post_params
    params.require(:post).permit(:content, :today_mood, :start_time)
  end
end
