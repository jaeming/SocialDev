class WelcomeController < ApplicationController

  def index
    @posts = Post.limit(10)
  end

  def about
  end
end
