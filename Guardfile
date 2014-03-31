# We don't want to run rubocop and inch if minitest failed.
group :in_progress, halt_on_fail: true do
  guard :rspec do
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/resthook/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
    watch('spec/spec_helper.rb')  { "spec" }

    # Rails example
    watch(%r{^app/resthook/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^app/resthook/(.*)(\.erb|\.haml|\.slim)$})          { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
    watch(%r{^app/resthook/controllers/(.+)_(controller)\.rb$})  do |m|
      [
        "spec/routing/#{m[1]}_routing_spec.rb",
        "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
        "spec/features/#{m[1]}_spec.rb"
      ]
    end
    watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
    watch('config/routes.rb')                           { "spec/routing" }
    watch('app/controllers/resthook/application_controller.rb')  { "spec/controllers" }

    # Capybara features specs
    watch(%r{^app/views/resthook/(.+)/.*\.(erb|haml|slim)$})     { |m| "spec/features/#{m[1]}_spec.rb" }
  end


  require 'guard/plugin'

  module ::Guard
    # Inch Guard for measuring documentation progress
    class Inch < ::Guard::Plugin
      def run_all
        puts 'inching along towards everything'
        Kernel.system('bundle exec inch')
      end

      def run_on_changes(paths)
        puts "inching towards #{paths}"
        Kernel.system('inch', paths.join)
      end
    end
  end

  guard :inch do
    watch(/app\/.*.rb$/)
    watch(/lib\/.*.rb$/)
    watch(/config\/.*.rb$/)
    watch(/README\.md$/)
  end
end
