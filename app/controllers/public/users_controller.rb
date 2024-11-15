class Public::UsersController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update, :out]

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def search
  end

  def check
  end

  def out
  end

  private

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(:current_user.id)
    end
  end
end
