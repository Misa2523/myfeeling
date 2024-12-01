class Public::UsersController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update, :out]

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
  end

  def out
  end

  private

  def user_params
    params.require(:user).permit(:name, :name_kana, :birthday, :email, :telephone_number, :is_active)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end
