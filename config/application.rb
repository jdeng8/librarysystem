require_relative 'boot'

require 'rails/all'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Userlibrary
  class Application < Rails::Application
    config.beginning_of_week = :sunday
    config.time_zone ='America/New_York'
    config.active_record.default_timezone = :local
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
#module Deviseapp
#  class Application < Rails::Application
#  ActionMailer::Base.smtp_settings={
#
#      :address =>'smtp.gmail.com',
#      :domain  =>'mail.google.com',
#      :port    => 587,
#      :user_name =>'',
#      :password =>'',
#      :authentication =>'login'
#      :enable_startlists_auto => true
#
#  }
#  end

