require 'rails_helper'

describe 'Url API' do
  before :each do
    create(:url, original: 'https://www.cnn.com/')
    create(:url, original: 'https://www.twitter.com/')
    create(:url, original: 'https://www.google.com/')
  end

  it 'can create a shortened url' do
    url_params = { original: 'https://www.espn.com/'}

    post '/api/v1/url', params: {url: url_params}
    url = Url.last

    expect(response).to be_successful
    expect(url.short).to_not eq(nil)
    expect(url.short).to be_a(String)
  end

  it 'returns an error if url is invalid' do
    url_params = { original: 'www.espn'}

    post '/api/v1/url', params: {url: url_params}

    error = JSON.parse(response.body)['error']['original'][0]

    expect(response.status).to eq(404)
    expect(error).to eq('is not a valid URL')
  end

  it 'can get an original url by its short url' do
    short = Url.last.short

    get "/#{short}"

    expect(response.headers["Content-Type"]).to eq "text/html; charset=utf-8"
  end

  it 'returns an error if short url is invalid' do
    short = "not_valid"

    get "/#{short}"

    error = JSON.parse(response.body)

    expect(status).to eq(400)
    expect(error['error']).to eq("Short url does not exist")
  end

  it 'can send a list of the top 100 urls' do
    create_list(:url, 100, clicks: 1)
    get '/api/v1/top'

    expect(response).to be_successful
    expect(Url.top_100.count).to eq(100)
  end
end