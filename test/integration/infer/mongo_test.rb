# frozen_string_literal: true

require 'test_helper'

module Integration
  module Infer
    class MongoTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper

      def root_entity_wrap
        'dummy_mongo_infer'
      end

      def root_collection_wrap
        'dummy_mongo_collection_infer'
      end
    end
  end
end
