class PostsController < ApplicationController
  def index;end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to pages_show_path, success: t('defaults.message.created')
    else
      flash.now['danger'] = t('defaults.message.not_created')
      render :new
    end
  end
  
  def show;end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to pages_show_path, success: t('defaults.message.updated')
    else
      flash.now['danger'] = t('defaults.message.not_updated')
      render :edit
    end
  end
  
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to pages_show_path, success: t('defaults.message.deleted', item: Post.model_name.human)
  end


  private

  def post_params
    params.require(:post).permit(:content, :today_mood)
  end
end
