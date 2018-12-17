require 'rails_helper'

describe 'Url API' do
  before :each do
    create(:url, original: 'https://www.cnn.com/')
    create(:url, original: 'https://www.twitter.com/')
    create(:url, original: 'https://www.google.com/')
  end

  it 'can create a shortened url' do
    url_params = { original: 'https://www.espn.com/'}

    post '/api/v1/urls', params: {url: url_params}
    url = Url.last

    expect(response).to be_successful
    expect(url.short).to_not eq(nil)
    expect(url.short).to be_a(String)
  end

  it 'can get an original url by its id' do
    id = Url.last.id

    get "/api/v1/urls/#{id}"

    expect(response.headers["Content-Type"]).to eq "text/html; charset=utf-8"
  end

  it 'can scrape url for title' do
    url_params = { original: 'https://www.nba.com/'}
    
    post '/api/v1/urls', params: {url: url_params}
    url = Url.last
    
    expect(response).to be_successful
    expect(url.title).to eq('The official site of the NBA | NBA.com')
  end

  xit 'can send a list of the top 100 urls' do
  # TODO Return 100 most frequently accessed urls
    get '/api/v1/urls'

    expect(response).to be_successful
    expect(Url.all.count).to eq(100)
  end
end