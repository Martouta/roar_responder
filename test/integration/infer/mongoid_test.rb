# frozen_string_literal: true

require 'test_helper'

module Integration
  module Infer
    class MongoidTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper

      def model_class
        DummyMongoModel
      end

      def root_entity_wrap
        'dummy_mongo_infer'
      end

      def perform_get_entity_request
        get infer_mongo_path(entity), as: :json
      end

      def root_collection_wrap
        'dummy_mongo_collection_infer'
      end

      def perform_get_collection_request
        get infer_mongo_index_path, as: :json
      end

      def create_path
        infer_mongo_index_path
      end
    end
  end
end
