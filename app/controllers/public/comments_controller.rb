class Public::CommentsController < ApplicationController

  def create
    feeling_post = FeelingPost.find(params[:feeling_post_id])
    comment = current_user.comments.new(comment_params)
    # comment.feeling_post_id = feeling_post.id
    comment.user_image_id = user_image.id
    comment.save
    redirect_to feeling_post_path(feeling_post)
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
