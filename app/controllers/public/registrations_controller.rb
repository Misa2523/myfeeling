class Public::RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters, if: :devise_controller? #deviseコントローラーに対しリクエストが行われている時に実行

  def after_sign_up_path_for(resource) #resourceには新規登録したユーザーの情報が渡される
    user_path(current_user.id) #リダイレクト先を設定（マイページ）
  end


  protected

  #deviseを使ったユーザー登録時に、追加のカスタム属性を許可するメソッド
  def configure_permitted_parameters
    #devise_parameter_sanitizer：Deviseによって提供されるパラメータを安全に処理する
    #psermit：指定したアクションで受け入れることができるパラメータを定義
    #keys:[...]：許可するパラメータのリストを定義
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :name_kana, :telephone_number, :birthday])
  end

end
