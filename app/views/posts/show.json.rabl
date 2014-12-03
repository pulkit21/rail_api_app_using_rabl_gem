object @post
attributes :id, :title, :body, :published_at, :created_at

child :user => :user do
  attributes :id, :email, :username, :gender
end

node(:like) { |a| a.get_likes.size }

child :comments => :comments do
  attributes :id, :body, :user
end