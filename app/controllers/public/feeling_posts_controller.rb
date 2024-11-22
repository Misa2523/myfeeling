class Public::FeelingPostsController < ApplicationController
  def new
    # viewへ渡すためのインスタンス変数に空のmodelオブジェクトを生成
    @feeling_post = FeelingPost.new
  end

  def create
    # データを受け取り新規登録するためのインスタンス作成
    @feeling_post = FeelingPost.new(feeling_post_params)
    # データをデータベースに保存するためのsaveメソッド実行
    if @feeling_post.save
      flash[:notice] = "投稿しました"
      redirect_to feeling_post_path(@feeling_post)
    else
      flash.now[:alert] = "投稿できませんでした"
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
  end

  private

  def feeling_post_params
    params.require(:feeling_post).permit(:title, :body)
    # params：formから送られてくるデータが入ってる
    # require：送られてきたデータの中からモデル名(ここでは:feeling_post)を指定しデータを絞り込む
    # permit：requireで絞り込んだデータの中から保存を許可するカラムを指定
  end

end
