require 'test_helper'

class SuperfeedrEngineTest < ActiveSupport::TestCase
  test 'truth' do
    assert_kind_of Module, SuperfeedrEngine
  end

  test 'it has version' do
    refute_nil SuperfeedrEngine::VERSION
  end
end
