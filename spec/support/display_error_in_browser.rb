def open_error_in_browser(html_body = response.body)
  File.write('remove_me.html', html_body)
  `open remove_me.html`
  sleep 2
  `rm remove_me.html`
end
