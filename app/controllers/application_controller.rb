class ApplicationController < ActionController::Base
  # ログイン状態によって表示するページを切り替えるdeviseのメソッド
  # before_actionで呼び出すことで、アクションを実行する前にログインしていなければログイン画面に遷移させられる
  before_action :authenticate_user!
  # もしdeviseに関するコントローラーの処理であれば、そのときだけconfigure_permitted_parametersメソッドを実行するように設定
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  # メソッド名は慣習
  def configure_permitted_parameters
    # deviseのUserモデルにパラメーターを許可 :deviseの処理名 keys: [:許可するキー]
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :position, :occupation])
  end


end
