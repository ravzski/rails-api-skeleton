require 'rails_helper'

describe User do

  let!(:user) do
    User.create(
      first_name: 'User13',
      last_name: 'User1',
      email: 'user13@test.com',
      password: 'password1')

  end


  it 'has password encryption' do
    expect(user.encrypted_password).not_to eql('password1')
  end

  describe '#valid_password?' do

    it 'returns false for wrong password' do
      expect(user.valid_password?('wrong password')).to be_falsy
    end

    it 'returns true for correct password' do
      expect(user.valid_password?('password1')).to be_truthy
    end

  end


end
