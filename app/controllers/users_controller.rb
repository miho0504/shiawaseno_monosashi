class UsersController < ApplicationController

  def show
    unless user_signed_in?
    redirect_to user_session_path, alert: t('defaults.message.login')
    end
  end
end
