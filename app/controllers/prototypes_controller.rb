class PrototypesController < ApplicationController
  def index
  end

  # prototypesコントローラーにnewアクションとcreateアクションを設定
  # newアクションにインスタンス変数@prototypeを定義し、Prototypeモデルの新規オブジェクトを代入
  def new
    @prototype = Prototype.new
  end

  def create
  end



  private
  # prototypesコントローラーのprivateメソッドにストロングパラメーターをセットし、特定の値のみを受け付けるようにした。且つ、user_idもmergeした
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

end
