# frozen_string_literal: true

require 'test_helper'

module Integration
  module Infer
    class ActiveRecordTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper

      def model_class
        DummyActiveRecordModel
      end

      def root_entity_wrap
        'dummy_active_record_infer'
      end

      def root_collection_wrap
        'dummy_active_record_collection_infer'
      end
    end
  end
end
