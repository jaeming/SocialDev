class PostsController < ApplicationController
def index
  @posts = Post.visible_to(current_user).where("posts.created_at > ?", 500.days.ago).paginate(page: params[:page], per_page: 10)
end

end