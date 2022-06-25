# frozen_string_literal: true

require 'test_helper'

module Integration
  module ClassSpec
    class PoroTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper

      def model_class
        DummyPoro
      end

      def entity_path
        class_spec_poro_path(entity)
      end

      def collection_path
        class_spec_poro_index_path
      end
    end
  end
end
