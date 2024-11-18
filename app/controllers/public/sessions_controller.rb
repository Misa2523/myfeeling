class Public::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource) #resourceにはサインインしたユーザーの情報が渡される
    user_path(current_user.id) #リダイレクト先を設定
  end

  def after_sign_out_path_for(resource_or_scope) #resource_or_scopeにはサインアウトしたリソースやスコープの情報が渡される
    about_path #アバウトページへ遷移
  end

  protected

end
