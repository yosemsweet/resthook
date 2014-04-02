# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../spec/dummy/config/environment', __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'coveralls'
Coveralls.wear!

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join('../../spec/support/**/*.rb')].each { |f| require f }

# Need to manually require factories as the rails root is different from
# the gem root
Dir[Rails.root.join('../../spec/factories/**/*.rb')].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  # Make sure we only use the super awesome expect syntax instead of the old
  # not as awesome should syntax
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'
end
