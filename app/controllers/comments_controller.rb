class CommentsController < ApplicationController

  # commentsコントローラーにcreateアクションを設定
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    
    # データが保存されなかったときは詳細ページに戻るようrenderを用いて記述した
    # なぜrenderを使っている?→途中まで記述したコメントを残すため
    # アクション1行目のインスタンス変数は残り続ける
    # render後のshowに渡すためのインスタンス変数を作成(renderはコントローラー経由がされない)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show"
    end
  end


  private
# commentsコントローラーのprivateメソッドにストロングパラメーターをセットし、特定の値のみを受け付けるようにした。
# 且つ、user_idとprototype_idもmergeした
  def comment_params
    params.require(:comment).permit(:text).merge( user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
