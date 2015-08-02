require 'rails_helper'

describe 'POST /api/session' do

  let(:credentials) { { email: 'test@test.com', password: 'password' } }
  let(:user) { User.create(credentials) }


  def post_request(creds)
    auth_post '/api/session', credentials: creds
  end


  context 'correct credentails' do

    before do
      post_request(email: user.email, password: 'password')
    end

    it 'returns 200 status' do
      expect(response.status).to eq 200
    end

    it 'returns auth token' do
      expect(response_json).not_to be_nil
    end

  end


  context 'wrong credentails' do

    before do
      post_request(email: user.email, password: 'wrong password')
    end

    it 'returns eq 403 status' do
      expect(response.status).to eq 403
    end

    it 'returns error message' do
      expect(response_json['error']).not_to be_blank
      expect(response_json['error']).to eq 'Incorrect email or password'
    end

  end

end
