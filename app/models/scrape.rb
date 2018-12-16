class Scrape

  def self.perform(url)
    Nokogiri::HTML::Document.parse(HTTParty.get(url).body).title
  end
end