class Public::CommentsController < ApplicationController

  def create
    feeling_post = FeelingPost.find(params[:feeling_post_id]) #URLやフォームから送信されたfeeling_post_idの値を取得し、FeelingPostモデルに対応するレコードをfindメソッドで検索し、その結果をfeeling_postという変数に代入
    comment = current_user.comments.new(comment_params) # comment = Comment.new(comment_params) と comment.user_id = current_user.id をまとめた記述
    comment.feeling_post_id = feeling_post.id # 1行目で取得したFeelingPostオブジェクトのIDをcomment.feeling_post_idに設定し、コメントがどのFeelingPostに属するか指定
    comment.save
    redirect_to request.referer # 元のページにリダイレクト
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
