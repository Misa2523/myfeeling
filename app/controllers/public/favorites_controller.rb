class Public::FavoritesController < ApplicationController

  def create
    feeling_post = FeelingPost.find(params[:feeling_post_id]) #URLやフォームから送信されたfeeling_post_idの値を取得し、FeelingPostモデルに対応するレコードをfindメソッドで検索し、その結果をfeeling_postという変数に代入
    favorite = current_user.favorites.new(feeling_post_id: feeling_post.id)  # favorite = Favorite.new(favorite_params) と favorite.user_id = current_user.id をまとめた記述
    # ↑ feeling_post_idに現在取得したfeeling_post.idを設定
    favorite.save
    redirect_to request.referer
  end

  def destroy
    feeling_post = FeelingPost.find(params[:feeling_post_id])
    favorite = current_user.favorites.find_by(feeling_post_id: feeling_post.id)
    favorite.destroy
    redirect_to request.referer
  end

  def index
  end
end
