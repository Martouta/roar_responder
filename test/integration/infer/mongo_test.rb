# frozen_string_literal: true

require 'test_helper'

module Integration
  module Infer
    class MongoTest < ActionDispatch::IntegrationTest
      include ::RoarResponder::TestHelpers::IntegrationTesterHelper
    end
  end
end
