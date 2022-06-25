# frozen_string_literal: true

require 'test_helper'

module Integration
  module Infer
    class PoroTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper

      def model_class
        DummyPoro
      end

      def root_entity_wrap
        'dummy_poro_infer'
      end

      def perform_get_entity_request
        get infer_poro_path(id: 1), as: :json
      end

      def root_collection_wrap
        'dummy_poro_collection_infer'
      end

      def collection_path
        infer_poro_index_path
      end
    end
  end
end
