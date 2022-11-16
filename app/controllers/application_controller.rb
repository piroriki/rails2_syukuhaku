class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller? 


#ログイン後の遷移先をトップページに、新規登録後の遷移先をプロフィール編集画面に設定する
def after_sign_in_path_for(resource)
 if current_user
  flash[:notice] = "ログインに成功しました"
  tops_path
 else
  flash[:notice] = "新規登録完了しました。次に名前を入力してください"
  edit_user_registration_path
 end
end

protected

def configure_permitted_parameters
 added_attrs = [ :name, :email, :password ]
 devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
end

end
