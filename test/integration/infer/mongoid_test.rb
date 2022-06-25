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

      def entity_path
        infer_mongo_path(entity)
      end

      def root_collection_wrap
        'dummy_mongo_collection_infer'
      end

      def collection_path
        infer_mongo_index_path
      end
    end
  end
end
