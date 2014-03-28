# A sample Guardfile
# More info at https://github.com/guard/guard#readme

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
      puts 'inching towards #{paths}'
      Kernel.system('inch', paths)
    end
  end
end

guard :inch do
  watch(/app\/.*.rb$/)
  watch(/lib\/.*.rb$/)
  watch(/config\/.*.rb$/)
  watch(/README\.md$/)
end
