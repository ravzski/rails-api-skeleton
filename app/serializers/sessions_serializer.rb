class SessionsSerializer

  def self.show current_user
    {
      id: current_user.id,
      email: current_user.email,
      first_name: current_user.first_name,
      last_name: current_user.last_name,
      access_token: current_user.access_token
    }
  end

  def self.create user
    {
      auth_token: user.access_token,
      user_id: user.id  
    }
  end

end
