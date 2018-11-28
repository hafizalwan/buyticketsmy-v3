Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.require_master_key = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.active_storage.service = :amazon
  config.force_ssl = true
  config.log_level = :debug
  config.log_tags = [ :request_id ]
  config.action_mailer.perform_caching = false
  config.action_mailer.raise_delivery_errors = true
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false

  config.action_mailer.default_url_options = { host: 'buytickets.my' }

  ActionMailer::Base.smtp_settings = {
  :user_name => "<%= Rails.application.credentials.dig(:sendgrid, :sendgrid_username) %>",
  :password => "<%= Rails.application.credentials.dig(:sendgrid, :sendgrid_password) %>",
  :domain => "buytickets.my",
  :address => "smtp.sendgrid.net",
  :port => 465,
  :authentication => :plain,
  :enable_starttls_auto => true
}

end
