#
# Authenticated requests
#
[:get, :patch, :put, :post, :delete].each do |method|

  define_method "auth_#{method}" do |path, *args|
    request_details = {browser: 'chrome',device: 'desktop',device_id: '0'}

    params = args[0]
    headers = args[1] || {}
    auth_token = current_user.set_access_token request_details
    send(method, path, params, headers.merge(Authorization: auth_token, Browser: 'chrome', Device: 'desktop', DeviceId: '0'))
  end

end
