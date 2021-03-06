require 'rubygems'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'

Spring.watch "#{Rails.root}/spec/factories"
ENV["RAILS_ENV"] ||= 'test'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.infer_base_class_for_anonymous_controllers = false
  config.use_transactional_fixtures = true
  config.order = "random"

  config.include FactoryGirl::Syntax::Methods
  config.include Warden::Test::Helpers, type: :feature
  config.include RequestHelpers, type: :feature
  config.include Devise::TestHelpers, type: :controller
  config.include ControllerHelpers, type: :controller
end
Geocoder.stubs(:search).returns([])
