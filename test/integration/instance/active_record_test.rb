# frozen_string_literal: true

require 'test_helper'

module Integration
  module Instance
    class ActiveRecordTest < ActionDispatch::IntegrationTest
      def test_get_entity
        DummyActiveRecordModel.create(**dummy_attrs)

        get instance_active_record_entity_path, as: :json

        assert_response :ok
        assert_response_entity JSON.parse(response.body)
      end

      def test_get_collection
        collection_size = 2
        collection_size.times { DummyActiveRecordModel.create(**dummy_attrs) }

        get instance_active_record_collection_path, as: :json

        assert_response :ok

        response_collection = JSON.parse(response.body)

        assert_self_link(response_collection, 'dummy_collection', '/collection')

        items = response_collection.dig('dummy_collection', 'items') || []
        assert_equal collection_size, items.length
        items.each(&method(:assert_response_entity))
      end

      def test_post_entity_success
        post instance_active_record_entity_path, params: { model: dummy_attrs }, as: :json

        assert_response :created
        assert_response_entity JSON.parse(response.body)
      end

      def test_post_entity_failure
        post instance_active_record_entity_path, params: { model: dummy_attrs.merge('dummy_string' => 'invalid') },
                                                 as: :json

        assert_response :unprocessable_entity
        assert_response_error JSON.parse(response.body)
      end

      private

      def assert_response_entity(response_entity)
        response_id = response_entity.dig('dummy', 'id')
        assert_instance_of Integer, response_id
        assert_equal dummy_attrs[:dummy_integer], response_entity.dig('dummy', 'dummy_integer')
        assert_equal dummy_attrs[:dummy_string], response_entity.dig('dummy', 'dummy_string')

        response_created_at = Time.parse(response_entity['dummy']['created_at'])
        assert_in_delta Time.now, response_created_at, 2.seconds

        assert_self_link(response_entity, 'dummy', "example/#{response_id}")
      end

      def assert_self_link(parsed_json, root_wrap, expected_url)
        self_link = parsed_json.dig(root_wrap, 'links', 0)
        assert_equal expected_url, self_link['href']
        assert_equal 'self', self_link['rel']
      end

      def assert_response_error(parsed_json)
        expected_response = { 'errors' => { 'dummy_string' => ['invalid'] } }
        assert_equal expected_response, parsed_json
      end

      def dummy_attrs
        { dummy_integer: 4, dummy_string: 'bar' }
      end
    end
  end
end
