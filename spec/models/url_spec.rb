require 'rails_helper'

RSpec.describe Url, type: :model do
  context "Attributes" do
    it "should return url info" do
      url = create(:url, original: 'https://www.google.com/')

      expect(url.original).to eq('https://www.google.com/')
      expect(url.random_id).to_not eq(nil)
      expect(url.random_id).to be_a(String)
    end
  end 
end
