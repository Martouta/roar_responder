# frozen_string_literal: true

require 'test_helper'

module Integration
  module ClassSpec
    class ActiveRecordTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper

      def model_class
        DummyActiveRecordModel
      end

      def entity_path
        class_spec_active_record_path(entity)
      end

      def collection_path
        class_spec_active_record_index_path
      end
    end
  end
end
