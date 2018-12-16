require 'rails_helper'

RSpec.describe Scrape, type: :model do
  context "class methods" do
    it "can scrape for title" do
      url = create(:url, original: 'https://www.google.com/')
  
      expect(Scrape.perform(url.original)).to eq('Google')
    end
  end
end