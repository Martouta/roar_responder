# frozen_string_literal: true

require 'test_helper'

module Integration
  module ClassSpec
    class MongoidTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper

      def model_class
        DummyMongoModel
      end

      def namespace
        'class_spec'
      end

      def orm
        'mongo'
      end
    end
  end
end
