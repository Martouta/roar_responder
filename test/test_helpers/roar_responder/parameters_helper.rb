# frozen_string_literal: true

module RoarResponder
  module TestHelpers
    module ParametersHelper
      def dummy_attrs
        { dummy_integer: 42, dummy_string: 'bar' }
      end

      def dummy_invalid_attrs
        dummy_attrs.merge('dummy_string' => 'invalid')
      end
    end
  end
end

ActionDispatch::IntegrationTest.include ::RoarResponder::TestHelpers::ParametersHelper
