# We don't want to run rubocop and inch if minitest failed.
group :in_progress, halt_on_fail: true do
  guard :minitest do
    watch(/^test\/.+_test\.rb$/)
    watch('test\/test_helper.rb')  { 'test' }
    watch(/^lib\/(.+)\.rb$/) { |m| 'test/#{m[1]}_test.rb' }
    watch(/^lib\/(.+)\.rb$/) { |m| 'test/integration' }

    # Rails 4
    watch(/^app\/(.+)\.rb/) { |m| 'test/#{m[1]}_test.rb' }
    watch(%r{^app/controllers/*\.rb}) { 'test/controllers' }
  end

  guard :rubocop do
    watch(/.+\.rb$/)
    watch(/(?:.+\/)?\.rubocop\.yml$/) { |m| File.dirname(m[0]) }
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
