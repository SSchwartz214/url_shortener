class Url < ApplicationRecord
  validates :original, url: true
  after_create :generate_short, :scrape_title
  validates_uniqueness_of :short
  
  scope :top_100, -> { order(clicks: :desc).limit(100)}
  
  def generate_short
    self.short = self.id.to_s(36)

    self.save
  end

  def scrape_title
    ScrapeWorker.perform_async(id)
  end
end