# frozen_string_literal: true

require 'test_helper'

module Integration
  module Infer
    class ActiveRecordTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper
    end
  end
end
