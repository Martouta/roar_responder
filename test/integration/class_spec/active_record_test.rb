# frozen_string_literal: true

require 'test_helper'

module Integration
  module ClassSpec
    class ActiveRecordTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper

      def model_class
        DummyActiveRecordModel
      end

      def namespace
        'class_spec'
      end

      def orm
        'active_record'
      end
    end
  end
end
