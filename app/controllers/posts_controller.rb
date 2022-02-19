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

  private

  def post_params
    params.require(:post).permit(:content, :today_mood)
  end
end
