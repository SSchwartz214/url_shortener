class Url < ApplicationRecord
  validates_presence_of :original
  after_create :generate_short, :fetch_title
  
  def generate_short
    self.short = self.id.to_s(36)

    self.save
  end

  def scrape_title
    scraped_title = Scrape.perform(original)
    self.update_attributes(title: scraped_title)
  end
end