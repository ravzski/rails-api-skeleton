require 'rails_helper'

describe 'GET /api/session' do


  context 'authenticated request' do

    before do
      auth_get '/api/session'
    end

    it 'returns 200 status' do
      expect(response.status).to eq 200
    end

    it 'returns user details' do
      expect(response_json['email']).to eq current_user.email
    end

  end


  context 'unauthenticated request' do

    before do
      get '/api/session'
    end

    it 'returns eq 401 status' do
      expect(response.status).to eq 401
    end


  end

end
