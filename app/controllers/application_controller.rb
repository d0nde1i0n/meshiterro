class ApplicationController < ActionController::Base

  # devise_controller使用前に、実施する処理の条件
  before_action :configure_permited_parameters,if: :devise_controller?

  # サインイン後に遷移するページの指定
  def after_sign_in_path_for(resourse)
    post_images_path
  end

  # サインアウト後に遷移するページの指定
  def after_sign_out_path_for(resourse)
    about_path
  end

  protected
  # ユーザ登録の際に、ユーザ名のデータ操作を許可をする。
  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
  end
end
