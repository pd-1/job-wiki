class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
    def after_sign_in_path_for(resource)
      if current_user
        flash[:notice] = "ログインに成功しました" 
        jobs_path  # 指定したいパスに変更
      else
        flash[:notice] = "新規登録完了しました。" 
        jobs_path  # 指定したいパスに変更
      end
    end
  
    private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:image,:category_id])
    end
  
  end
  