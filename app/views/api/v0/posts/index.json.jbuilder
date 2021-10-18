json.array! @posts do |post|
    json.partial! "api/v0/posts/post", post: post
end
