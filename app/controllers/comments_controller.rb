class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params.merge(post: @post))
    @topic = @post.topic
    @new_comment = Comment.new

    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was saved."
    else
      flash[:error] = "Something bad happened."
      # redirect_to [post.topic, post]
    end

    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
    end

  end



  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment Couldn't be deleted. Try again."
    end

    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }

    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end

