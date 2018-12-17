class Url < ApplicationRecord
  validates_presence_of :original
  after_create :assign_short, :scrape_title
  validates_uniqueness_of :short
  scope :top_100, -> { order(clicks: :desc).limit(100)}
  
  def assign_short
    generated_short = self.id.to_s(36)

    if Url.exists?(short: generated_short)
      assign_short
    else
      update_attribute(:short, generated_short)
    end
  end

  def scrape_title
    scraped_title = Scrape.perform(self.original)
    self.update_attributes(title: scraped_title)
  end
end