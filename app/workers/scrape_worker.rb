class ScrapeWorker
  include Sidekiq::Worker

  def perform(id)
    url = Url.find(id)
    scraped_title = Nokogiri::HTML::Document.parse(HTTParty.get(url.original).body).title
    
    url.update_attributes(title: scraped_title)
  end
end