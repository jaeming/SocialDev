class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = post.id
    if @comment.save
      redirect_to [post.topic, post]
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end

