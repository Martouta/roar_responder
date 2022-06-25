# frozen_string_literal: true

require 'test_helper'

module Integration
  module ClassSpec
    class PoroTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper

      def model_class
        DummyPoro
      end

      def namespace
        'class_spec'
      end

      def orm
        'poro'
      end
    end
  end
end
