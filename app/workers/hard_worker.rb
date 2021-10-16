class HardWorker
  include Sidekiq::Worker

  def perform(*args)
    highlights = Highlight.where(:created_at => 1.month.ago.beginning_of_month..1.month.ago.end_of_month)

    if highlights
      highlights.each do |highlight| 
        highlight.destroy!
      end
    end
  end
end
