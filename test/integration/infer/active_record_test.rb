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

      def perform_get_entity_request
        get infer_active_record_path(entity), as: :json
      end

      def root_collection_wrap
        'dummy_active_record_collection_infer'
      end

      def collection_path
        infer_active_record_index_path
      end
    end
  end
end
