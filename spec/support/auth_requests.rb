#
# Authenticated requests
#
[:get, :patch, :put, :post, :delete].each do |method|

  define_method "auth_#{method}" do |path, *args|

    params = args[0]
    headers = args[1] || {}
    send(method, path, params, headers.merge(Authorization: current_user.access_token, UserId: current_user.id))
  end

end
