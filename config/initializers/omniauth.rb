Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['app_id'], ENV['app_secret'], { scope: 'manage_pages, pages_show_list, publish_pages, email' }
  provider :google_oauth2, ENV['client_id'], ENV['client_secret'], { scope: 'contacts, plus.login, plus.me, userinfo.email, userinfo.profile, https://mail.google.com' }
  provider :twitter, ENV['key'], ENV['secret'], { :secure_image_url => 'true', :image_size => 'original' }
  configure do |config|
      config.failure_raise_out_environments = []
  end
end