require 'rails_helper'

RSpec.describe Url, type: :model do
  context "Attributes" do
    it "should return link info" do
      url = create :url

      expect(url.original).to eq('https://www.google.com/')
      expect(url.random_id).to eq('abc')
    end

  end 
end
