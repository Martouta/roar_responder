# frozen_string_literal: true

require 'test_helper'

module Integration
  module ClassSpec
    class MongoidTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper

      def model_class
        DummyMongoModel
      end

      def perform_get_entity_request
        get class_spec_mongo_path(entity), as: :json
      end

      def perform_get_collection_request
        get class_spec_mongo_index_path, as: :json
      end

      def create_path
        class_spec_mongo_index_path
      end
    end
  end
end
