class UsersController < ApplicationController
  # usersコントローラーにshowアクションを定義usersコントローラーにshowアクションを定義
  def show
    # usersコントローラーのshowアクションにインスタンス変数@userを定義。且つ、Pathパラメータで送信されるID値で、Userモデルの特定のオブジェクトを取得するように記述しそれを@userに代入
    @user = User.find(params[:id])
  end

end
