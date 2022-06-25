# frozen_string_literal: true

require 'test_helper'

module Integration
  module ClassSpec
    class ActiveRecordTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper

      def model_class
        DummyActiveRecordModel
      end

      def perform_get_entity_request
        get class_spec_active_record_path(entity), as: :json
      end

      def collection_path
        class_spec_active_record_index_path
      end
    end
  end
end
