class PrototypesController < ApplicationController
  def index
    # インスタンス変数@prototypesを定義し、すべてのプロトタイプの情報を代入
    @prototypes = Prototype.all
  end

  # prototypesコントローラーにnewアクションとcreateアクションを設定
  # newアクションにインスタンス変数@prototypeを定義し、Prototypeモデルの新規オブジェクトを代入
  def new
    @prototype = Prototype.new
  end

  def create
    # createアクションにデータ保存のための記述
    # 保存されたときはルートパスに戻る(redirect_to)
    # 保存されなかったときは新規投稿ページへ戻る(render)
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  # prototypesコントローラーにshowアクションを設定
  # showアクションにインスタンス変数@prototypeを定義した。且つ、Pathパラメータで送信されるID値で、Prototypeモデルの特定のオブジェクトを取得するように記述し、それを@prototypeに代入した
  def show
    @prototype = Prototype.find(params[:id])
  end


  private
  # prototypesコントローラーのprivateメソッドにストロングパラメーターをセットし、特定の値のみを受け付けるようにした。且つ、user_idもmergeした
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

end
