# frozen_string_literal: true

require 'test_helper'

module Integration
  module Instance
    class MongoidTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper

      def model_class
        DummyMongoModel
      end

      def entity_path
        instance_mongo_path(entity)
      end

      def collection_path
        instance_mongo_index_path
      end
    end
  end
end
