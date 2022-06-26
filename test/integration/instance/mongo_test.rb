# frozen_string_literal: true

require 'test_helper'

module Integration
  module Instance
    class MongoTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper

      def model_class
        DummyMongoModel
      end
    end
  end
end
