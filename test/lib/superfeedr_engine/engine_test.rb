require 'test_helper'
require 'minitest/autorun'

module SuperfeedrEngine
  class EngineTest < ActionController::TestCase
    def setup
      @engine = SuperfeedrEngine::Engine
      @validationError = SuperfeedrEngine::ValidationError
    end

    test 'requires url method on the instance' do
      instance = Class.new
      error = assert_raises @validationError do
        @engine.validate_url(instance)
      end

      assert_match(/Missing :url property on/, error.message)
    end

    test 'requires valid url on the instance' do
      class FeedWithInvalidURL
        def url
          'www.example.com'
        end
      end

      instance = FeedWithInvalidURL.new
      error = assert_raises @validationError do
        @engine.validate_url(instance)
      end

      assert_match(/url must be a URL/, error.message)
    end

    test 'requires id method on the instance' do
      instance = Class.new
      error = assert_raises @validationError do
        @engine.validate_id(instance)
      end

      assert_match(/Missing :id property on/, error.message)
    end

    test 'requires id to not be empty' do
      class FeedWithInvalidId
        def id
          ''
        end
      end

      instance = FeedWithInvalidId.new
      error = assert_raises @validationError do
        @engine.validate_id(instance)
      end

      assert_match(/id cannot be empty./, error.message)
    end

    test 'requires secret method on the instance' do
      instance = Class.new
      error = assert_raises @validationError do
        @engine.validate_secret(instance)
      end

      assert_match(/Missing :secret property on/, error.message)
    end

    test 'requires secret to not be empty' do
      class FeedWithInvalidSecret
        def secret
          ''
        end
      end

      instance = FeedWithInvalidSecret.new
      error = assert_raises @validationError do
        @engine.validate_secret(instance)
      end

      assert_match(/secret cannot be empty./, error.message)
    end
  end
end
