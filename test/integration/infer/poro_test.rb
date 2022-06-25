# frozen_string_literal: true

require 'test_helper'

module Integration
  module Infer
    class PoroTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper

      def root_entity_wrap
        'dummy_poro_infer'
      end

      def perform_get_entity_request
        get infer_poro_path(id: 1), as: :json
      end

      def root_collection_wrap
        'dummy_poro_collection_infer'
      end

      def perform_get_collection_request
        get infer_poro_index_path, as: :json
      end

      def create_path
        infer_poro_index_path
      end
    end
  end
end
