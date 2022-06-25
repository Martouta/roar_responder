# frozen_string_literal: true

require 'test_helper'

module Integration
  module Infer
    class PoroTest < ActionDispatch::IntegrationTest
      def test_get_entity
        get infer_poro_path(id: 1), as: :json

        assert_response :ok
        assert_response_entity JSON.parse(response.body), 'dummy_poro_infer'
      end

      def test_get_collection
        get infer_poro_index_path, as: :json

        assert_response :ok

        response_collection = JSON.parse(response.body)

        root_wrap = 'dummy_poro_collection_infer'

        assert_self_link(response_collection, root_wrap, '/collection')

        items = response_collection.dig(root_wrap, 'items') || []
        assert_equal 2, items.length
        items.each(&method(:assert_response_entity))
      end

      def test_post_entity_success
        post infer_poro_index_path, params: { model: dummy_attrs }, as: :json

        assert_response :created
        assert_response_entity JSON.parse(response.body), 'dummy_poro_infer'
      end

      def test_post_entity_failure
        post infer_poro_index_path, params: { model: dummy_invalid_attrs }, as: :json

        assert_response :unprocessable_entity
        assert_response_error JSON.parse(response.body)
      end
    end
  end
end
