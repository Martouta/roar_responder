# frozen_string_literal: true

require 'test_helper'

module Integration
  module ClassSpec
    class PoroTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper
    end
  end
end
