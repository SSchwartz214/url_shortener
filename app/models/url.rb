class Url < ApplicationRecord
  validates_presence_of :original
  after_create :generate_short, :scrape_title
  scope :top_100, -> { order(clicks: :desc).limit(100)}
  
  def generate_short
    self.short = self.id.to_s(36)

    self.save
  end

  def scrape_title
    scraped_title = Scrape.perform(self.original)
    self.update_attributes(title: scraped_title)
  end
end