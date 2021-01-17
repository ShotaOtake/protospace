class PrototypesController < ApplicationController
  # コントローラで定義されたアクションが実行される前に、共通の処理を行う
  before_action :set_prototype, except: [:index, :new, :create] 
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
    # @prototype = Prototype.find(params[:id])
    # @commentというインスタンス変数を定義し、Commentモデルの新規オブジェクトを代入
    @comment = Comment.new
  end

  # prototypesコントローラーにeditアクションとupdateアクションを設定
  # editアクションにインスタンス変数@prototypeを定義した。且つ、Pathパラメータで送信されるID値で、Prototypeモデルの特定のオブジェクトを取得するように記述し、それを@prototypeに代入した
  def edit
    # @prototype = Prototype.find(params[:id])
  end

  def update
    # @prototype = Prototype.find(params[:id])
    # データを更新する記述をし、更新されたときはそのプロトタイプの詳細ページに戻るような記述をした
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
      # データが更新されなかったときは、編集ページに戻るようにrenderを用いて記述した
    else
      render :edit
    end
  end

  # prototypesコントローラーにdestroyアクションを設定
  # destroyアクションに、プロトタイプを削除し、トップページに戻るような記述をした
  def destroy
    if @prototype.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  private
  # prototypesコントローラーのprivateメソッドにストロングパラメーターをセットし、特定の値のみを受け付けるようにした。且つ、user_idもmergeした
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

end
