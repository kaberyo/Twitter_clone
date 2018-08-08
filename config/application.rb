require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TwitterClone
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.active_record.default_timezone = :local
  end
end

# Time::DATE_FORMATS[:human] = lambda {|date|
#   seconds = (Time.now - date).round;
#   days    = seconds / (60 * 60 * 24); return "#{date.month}月#{date.day}日" if days > 0;
#   hours   = seconds / (60 * 60);      return "#{hours}時間前" if hours > 0;
#   minutes = seconds / 60;             return "#{minutes}分前" if minutes > 0;
#   return "#{seconds}秒前"
# }
