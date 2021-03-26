class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resouces)
    user_path(current_user)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    # ユーザー登録の際に名前のデータ操作を許可
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    # ログインの際に名前のデータ操作を許可
  end
end
