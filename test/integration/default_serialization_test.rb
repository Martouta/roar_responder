# frozen_string_literal: true

require 'test_helper'

module Integration
  class DefaultSerializationTest < ActionDispatch::IntegrationTest
    def test_default_serialization
      get default_serialization_path, as: :json

      assert_response :ok
      expected_response_body = { 'foo' => 'bar' }
      assert_equal expected_response_body, JSON.parse(response.body)
    end
  end
end
