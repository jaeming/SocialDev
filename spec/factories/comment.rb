FactoryGirl.define do
  factory :comment do
    body "this is a new comment"
    user
    post

    after(:build) do |comment|
      comment.class.skip_callback(:create, :after, :send_favorite_emails)
    end
  end
end