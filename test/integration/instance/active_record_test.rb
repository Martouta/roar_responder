# frozen_string_literal: true

require 'test_helper'

module Integration
  module Instance
    class ActiveRecordTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper

      def setup_get_entity_request
        @entity = DummyActiveRecordModel.create(**dummy_attrs)
      end

      attr_reader :entity

      def perform_get_entity_request
        get instance_active_record_path(entity), as: :json
      end

      def perform_get_collection_request
        get instance_active_record_index_path, as: :json
      end

      def create_path
        instance_active_record_index_path
      end
    end
  end
end
