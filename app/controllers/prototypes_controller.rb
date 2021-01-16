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

end
