require 'test_helper'

# Test our root level Resthook Module
class ResthookTest < ActiveSupport::TestCase
  test 'is an engine' do
    assert_includes Resthook::Engine.ancestors, Rails::Engine
  end
end
