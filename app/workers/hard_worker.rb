class HardWorker
  include Sidekiq::Worker

  def perform(*args)
    posts = Post.where(:highlight => true)

    if posts
      posts.each do |post| 
        post.highlight = 0
        post.save!
      end
    end
  end
end
