# class Users::RegistrationsController < Devise::RegistrationsController

#   protected

#   def after_update_path_for(resource)
#     # 自分で設定した「マイページ」へのパス
#     user_show_path(current_user)
#   end
#   # (略)
# end