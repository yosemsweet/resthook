$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "resthook/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "resthook"
  s.version     = Resthook::VERSION
  s.authors     = ["Yosem Sweet"]
  s.email       = ["yosem.sweet@gmail.com"]
  s.homepage    = "https://github.com/yosemsweet/resthook"
  s.summary     = "Add Resthooks to your Rails app with ease"
  s.description = "Resthook is a mountable implementation of the Resthook pattern. By adding Resthook to your rails application you can instantly provide discoverable callbacks and integrations. We've built it to integrate Rooster with Zapier."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.4"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "inch", '~> 0.3'
  s.add_development_dependency 'rubocop', '~> 0.18.1'
  s.add_development_dependency 'guard-rubocop', '~> 1.0'
  s.add_development_dependency 'rb-fsevent', '~> 0' if RUBY_PLATFORM =~ /darwin/i
  s.add_development_dependency 'terminal-notifier-guard', '~> 1.5' if RUBY_PLATFORM =~ /darwin/i
end
