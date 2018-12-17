require 'rails_helper'

RSpec.describe Url, type: :model do
  context "Validations" do
    it {should validate_presence_of :original}
  end

  context "Attributes" do
    it "should return url info" do
      url = create(:url)

      expect(url.original).to eq('https://www.google.com/')
      expect(url.short).to_not eq(nil)
      expect(url.short).to be_a(String)
    end
  end 

  context "Scope" do
    it "can return top 100 urls by clicks" do
      url = create_list(:url, 5)
      url = create_list(:url, 100, clicks: 1)

      expect(Url.top_100.count).to eq(100)
    end
  end 

  context "Instance methods" do
    it "can assign unique short urls" do
      url_1 = create(:url, original: 'https://www.google.com/')
      url_2 = create(:url, original: 'https://www.google.com/')
     
      expect(url_1.short).to_not eq(url_2.short)
    end
  end 
end