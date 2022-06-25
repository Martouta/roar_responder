# frozen_string_literal: true

require 'test_helper'

module Integration
  module Instance
    class PoroTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper

      def model_class
        DummyPoro
      end

      def namespace
        'instance'
      end

      def orm
        'poro'
      end
    end
  end
end
