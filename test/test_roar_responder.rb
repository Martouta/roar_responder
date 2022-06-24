# frozen_string_literal: true

require 'test_helper'

class TestRoarResponder < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RoarResponder::VERSION
  end

  class IntegrationTest < ActionDispatch::IntegrationTest
    # Test (integration) 'respond_with' 'representer_class' for a successful 'GET' request of an entity (Active Record)
    def test_integration_active_record_entity_get_success_for_instance_representer_class_attr
      example_attrs = { dummy_integer: 4, dummy_string: 'bar' }

      DummyActiveRecordModel.create(**example_attrs)

      get instance_active_record_entity_path, as: :json
      assert_response :ok
      actual_response = JSON.parse(response.body)
      response_id = actual_response.dig('dummy', 'id')
      assert_instance_of Integer, response_id
      assert_equal example_attrs[:dummy_integer], actual_response.dig('dummy', 'dummy_integer')
      assert_equal example_attrs[:dummy_string], actual_response.dig('dummy', 'dummy_string')
      response_created_at = Time.parse(actual_response['dummy']['created_at'])
      assert_in_delta Time.now, response_created_at, 2.seconds
      self_link = actual_response['dummy']['links'][0]
      assert_equal "example/#{response_id}", self_link['href']
      assert_equal 'self', self_link['rel']
    end
  end
end
