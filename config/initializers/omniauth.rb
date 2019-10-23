Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, ENV['SLACK_APP_CLIENT_ID'], ENV['SLACK_APP_CLIENT_SECRET'], scope: 'team:read,users:read,identify'
end
