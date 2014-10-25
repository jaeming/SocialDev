class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params.merge(post: @post))
    @topic = @post.topic
    # @comment.post_id = @post.id
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Something bad happened."
      # redirect_to [post.topic, post]
      render "posts/show"
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end

