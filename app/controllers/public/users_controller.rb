class Public::UsersController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user  = User.find(params[:id])
    #@user.user_id = current_user.id
    if @user.update(user_params)
      flash[:notice] = "編集内容を変更しました"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "編集内容を変更できませんでした"
      render :edit
    end
  end

  def search
  end

  def check
    @user = current_user
  end

  def out
    @user = current_user
    if @user.update(is_active: false) #is_activeカラムをfalseに更新（会員ステータスを退会状態に更新）。実際にはデータベース上の会員レコードは削除されない（論理削除）。
      reset_session #セッション情報をリセット（個人情報やアクション履歴の情報をリセット）
      flash[:notice] = "退会しました"
      redirect_to root_path
    else
      flash.now[:alert] = "正常に退会できませんでした"
      render :check
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :name_kana, :birthday, :email, :telephone_number, :user_image, :is_active)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end
