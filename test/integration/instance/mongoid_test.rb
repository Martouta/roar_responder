# frozen_string_literal: true

require 'test_helper'

module Integration
  module Instance
    class MongoidTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper

      def model_class
        DummyMongoModel
      end

      def namespace
        'instance'
      end

      def orm
        'mongo'
      end
    end
  end
end
