class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

# ログイン済ユーザーのみにアクセスを許可する
# before_action :authenticate_member!

# ransackでヘッダー部分の検索フォームを使用できるようにする
 before_action :set_search

# deviseコントローラーにストロングパラメータを追加する
 before_action :configure_permitted_parameters, if: :devise_controller? 


#ログイン後のリダイレクト先をトップページに、それ以外の条件に合致した場合はプロフィール編集画面をリダイレクト先にする
 def after_sign_in_path_for(resource)
  if current_member
   flash[:notice] = "ログインに成功しました"
   tops_path
  else
   flash[:notice] = "新規登録完了しました。次に名前を入力してください"
   edit_member_registration_path
  end
 end

 def set_search
  @q = Room.ransack(params[:q])
  @reselus = @q.result
 end

protected

#ログアウトした後のリダイレクト先をトップセージに設定する
def after_sign_out_path_for(resource)
 tops_path
end

#ログイン後、tops/indexに移動する
  def after_sign_in_path_for(resource)
    tops_path
  end

def configure_permitted_parameters
 added_attrs = [ :name, :email, :password ]
# サインアップ時にadded attrsのパラメータのストロングパラメータ追加
 devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
 devise_parameter_sanitizer.permit(:account_update, keys: [:name])
end

end
