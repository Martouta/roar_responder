# frozen_string_literal: true

require 'test_helper'

module Integration
  module Instance
    class PoroTest < ActionDispatch::IntegrationTest
      def test_get_entity
        get instance_poro_path(id: 1), as: :json

        assert_response :ok
        assert_response_entity JSON.parse(response.body)
      end

      def test_get_collection
        get instance_poro_index_path, as: :json

        assert_response :ok

        response_collection = JSON.parse(response.body)

        assert_self_link(response_collection, 'dummy_collection', '/collection')

        items = response_collection.dig('dummy_collection', 'items') || []
        assert_equal 2, items.length
        items.each(&method(:assert_response_entity))
      end

      def test_post_entity_success
        post instance_poro_index_path, params: { model: dummy_attrs }, as: :json

        assert_response :created
        assert_response_entity JSON.parse(response.body)
      end

      def test_post_entity_failure
        post instance_poro_index_path, params: { model: dummy_attrs.merge('dummy_string' => 'invalid') }, as: :json

        assert_response :unprocessable_entity
        assert_response_error JSON.parse(response.body)
      end
    end
  end
end
