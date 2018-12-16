require 'rails_helper'

describe 'Url API' do
  before :each do
    create_list(:url, 100)
  end

  it 'can create a shortened url' do
    url_params = { original: 'https://www.google.com/'}

    post '/api/v1/urls', params: {url: url_params}
    url = Url.last

    expect(response).to be_successful
    expect(url.random_id).to_not eq(nil)
    expect(url.random_id).to be_a(String)
    expect(url.random_id.length).to eq(8)
  end

    it 'can send a list of the top 100 urls' do
# TODO Return 100 most frequently accessed urls
    get '/api/v1/urls'

    expect(response).to be_successful
    expect(Url.all.count).to eq(100)
  end
end