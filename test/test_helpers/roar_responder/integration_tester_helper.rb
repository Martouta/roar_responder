# frozen_string_literal: true

require 'test_helper'

module RoarResponder
  module TestHelpers
    module IntegrationTesterHelper
      def test_get_entity
        setup_get_entity_request

        perform_get_entity_request

        assert_response :ok
        assert_response_entity JSON.parse(response.body), root_entity_wrap
      end

      def test_get_collection
        setup_get_collection_request

        perform_get_collection_request

        assert_response :ok
        response_collection = JSON.parse(response.body)
        assert_self_link(response_collection, root_collection_wrap, '/collection')
        items = response_collection.dig(root_collection_wrap, 'items') || []
        assert_equal collection_size, items.length
        items.each(&method(:assert_response_entity))
      end

      def test_post_entity_success
        post create_path, params: { model: dummy_attrs }, as: :json

        assert_response :created
        assert_response_entity JSON.parse(response.body), root_entity_wrap
      end

      def test_post_entity_failure
        post create_path, params: { model: dummy_invalid_attrs }, as: :json

        assert_response :unprocessable_entity
        assert_response_error JSON.parse(response.body)
      end

      private

      def root_entity_wrap
        'dummy'
      end

      def setup_get_entity_request
        # NOOP :)
      end

      def perform_get_entity_request
        raise NoMethodError, __method__
      end

      def collection_size
        2
      end

      def root_collection_wrap
        'dummy_collection'
      end

      def setup_get_collection_request
        # NOOP :)
      end

      def perform_get_collection_request
        raise NoMethodError, __method__
      end

      def create_path
        raise NoMethodError, __method__
      end
    end
  end
end
