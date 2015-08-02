def current_user
  @current_user ||= User.first_or_create(email: 'sample@email.com', password: 'password1', access_token: "12345", first_name: "first", last_name: "last")
end
