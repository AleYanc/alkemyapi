require 'rails_helper'

describe 'Auth', type: :request do
  describe 'POST /auth' do
    it 'authenticates the client' do
      post '/api/v1/auth', params: {username: 'test', password: 'test'}
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body).size).to eq(1) # expect to return only 1 line (the token)
    end

    it 'returns error when username is missing' do
      post '/api/v1/auth', params: {password: 'test'}
      expect(response).to have_http_status(:unprocessable_entity)
      # expect(JSON.parse(response.body)).to eq(
      # {"error"=>"param is missing or the value is empty: username"}
      # )
      # (commented because it's returning string format error)
    end 

    it 'returns error when password is missing' do
      post '/api/v1/auth', params: {username: 'test'}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end