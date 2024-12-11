class Public::RelationshipsController < ApplicationController

  # ユーザーをフォローする処理
  def create
    user = User.find(params[:user_id]) #フォロー対象のユーザーを特定
    current_user.follow(user) #ログインユーザーが↑ユーザーをフォロー(userモデルに記述したメソッドの呼び出し)
    redirect_to request.referer
  end

  # ユーザーのフォローを外す処理
  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to request.referer
  end


  # フォローしてるユーザーの一覧を取得する処理
  def followings
    user = User.find(params[:user_id]) #対象のユーザーを検索
    @users = user.followings #↑のユーザーがフォローしてるユーザーリストを取得し@usersに格納
  end

  # フォロワーの一覧を取得する処理
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end


end
