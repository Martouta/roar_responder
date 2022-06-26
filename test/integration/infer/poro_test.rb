# frozen_string_literal: true

require 'test_helper'

module Integration
  module Infer
    class PoroTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper

      def root_entity_wrap
        'dummy_poro_infer'
      end

      def root_collection_wrap
        'dummy_poro_collection_infer'
      end
    end
  end
end
