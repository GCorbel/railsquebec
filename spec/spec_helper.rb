require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/rails'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.infer_base_class_for_anonymous_controllers = false
    config.order = "random"

    config.include FactoryGirl::Syntax::Methods
    config.include Warden::Test::Helpers, type: :feature
    config.include RequestHelpers, type: :feature
    config.include Devise::TestHelpers, type: :controller
    config.include ControllerHelpers, type: :controller
  end
end

Spork.each_run do
  Dir["#{Rails.root}/app/models/*.rb"].each do |model|
    load model
  end
  FactoryGirl.reload
  Rails.cache.clear
  ActiveSupport::Dependencies.clear
end

