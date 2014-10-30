class FavoriteMailer < ActionMailer::Base
  default from: "daylightsavings@gmail.com"

    def new_comment(user, post, comment)

      # New Headers
      headers["Message-ID"] = "<comments/#{comment.id}@codeca.io>"
      headers["In-Reply-To"] = "<post/#{post.id}@codeca.io>"
      headers["References"] = "<post/#{post.id}@codeca.io>"

      @user = user
      @post = post
      @comment = comment

      mail(to: user.email, subject: "New comment on #{post.title}")
    end

end
