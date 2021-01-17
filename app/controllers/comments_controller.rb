class CommentsController < ApplicationController

  # commentsコントローラーにcreateアクションを設定
  def create
  end


  private
# commentsコントローラーのprivateメソッドにストロングパラメーターをセットし、特定の値のみを受け付けるようにした。
# 且つ、user_idとprototype_idもmergeした
  def comment_params
    params.require(:comment).permit(:text).merge( user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
