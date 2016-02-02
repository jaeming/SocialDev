class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params.merge(post: @post))
    @new_comment = Comment.new
    authorize @comment
    @comment.save
    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment
    @comment.destroy
    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
