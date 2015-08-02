def current_user
  @user ||= User.first_or_create(email: 'sample@email.com', password: 'password1')
end
