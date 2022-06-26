# frozen_string_literal: true

require 'test_helper'

module Integration
  module Instance
    class ActiveRecordTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper

      def model_class
        DummyActiveRecordModel
      end
    end
  end
end
