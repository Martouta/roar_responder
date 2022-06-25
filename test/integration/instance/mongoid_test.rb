# frozen_string_literal: true

require 'test_helper'

module Integration
  module Instance
    class MongoidTest < ActionDispatch::IntegrationTest
      def test_get_entity
        entity = DummyMongoModel.create(**dummy_attrs)

        get instance_mongo_path(entity), as: :json

        assert_response :ok
        assert_response_entity JSON.parse(response.body)
      end

      def test_get_collection
        collection_size = 2
        collection_size.times { DummyMongoModel.create(**dummy_attrs) }

        get instance_mongo_index_path, as: :json

        assert_response :ok

        response_collection = JSON.parse(response.body)

        assert_self_link(response_collection, 'dummy_collection', '/collection')

        items = response_collection.dig('dummy_collection', 'items') || []
        assert_equal collection_size, items.length
        items.each(&method(:assert_response_entity))
      end

      def test_post_entity_success
        post instance_mongo_index_path, params: { model: dummy_attrs }, as: :json

        assert_response :created
        assert_response_entity JSON.parse(response.body)
      end

      def test_post_entity_failure
        post instance_mongo_index_path, params: { model: dummy_invalid_attrs }, as: :json

        assert_response :unprocessable_entity
        assert_response_error JSON.parse(response.body)
      end
    end
  end
end
