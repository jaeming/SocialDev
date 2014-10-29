module TestFactories

  def associated_post(options={})
    post_options = {
      title: 'post title',
      body: 'body text that is over 20 character long',
      topic: Topic.create(name: 'topic name'),
      user: authenticated_user
    }.merge(options)

    Post.create(post_options)
  end

  def authenticated_user(options={})
    user_options = {email: "email#{rand}@fake.com", password: 'password'}.merge(options)
    user = User.new(user_options)
    user.skip_confirmation!
    user.save
    user
  end

end