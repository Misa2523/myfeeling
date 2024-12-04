class Public::FeelingPostsController < ApplicationController


  def new
    # viewへ渡すためのインスタンス変数に空のmodelオブジェクトを生成
    @feeling_post = FeelingPost.new
  end

  def create
    # データを受け取り新規登録するためのインスタンス作成
    @feeling_post = FeelingPost.new(feeling_post_params)
    # 投稿者を設定
    @feeling_post.user_id = current_user.id
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
    @feeling_post = FeelingPost.includes(:user).where(users: { is_active: true })
  end

  def show
    @feeling_post = FeelingPost.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @feeling_post = FeelingPost.find(params[:id])
  end

  def update
    @feeling_post = FeelingPost.find(params[:id])
    @feeling_post.user_id = current_user.id
    if @feeling_post.update(feeling_post_params)
      flash[:notice] = "投稿内容を変更しました"
      redirect_to feeling_post_path(@feeling_post)
    else
      flash.now[:alert] = "投稿内容を変更できませんでした"
      render :edit
    end
  end

  def destroy
    @feeling_post = FeelingPost.find(params[:id])
    if @feeling_post.destroy
      flash[:notice] = "削除しました"
      redirect_to feeling_posts_path
    else
      flash.now[:alert] = "削除できませんでした"
      render :show
    end
  end

  def search
  end

  private

  def feeling_post_params
    params.require(:feeling_post).permit(:user_id, :title, :body)
    # params：formから送られてくるデータが入ってる
    # require：送られてきたデータの中からモデル名(ここでは:feeling_post)を指定しデータを絞り込む
    # permit：requireで絞り込んだデータの中から保存を許可するカラムを指定
  end

end
