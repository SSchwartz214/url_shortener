class Url < ApplicationRecord
  validates_presence_of :original
  after_create :generate_random_id, :scrape_title

  LETTERS = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
  
  def generate_random_id
      self.random_id = (0...8).map { LETTERS[rand(LETTERS.length)] }.join
   
      self.save
  end

  def scrape_title
    Nokogiri::HTML::Document.parse(HTTParty.get('https://www.google.com/').body).title
  end
end