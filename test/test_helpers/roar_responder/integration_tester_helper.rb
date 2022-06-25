# frozen_string_literal: true

require 'test_helper'

module RoarResponder
  module TestHelpers
    module IntegrationTesterHelper
      def test_get_entity
        setup_get_entity_request

        get entity_path, as: :json

        assert_response :ok
        assert_response_entity JSON.parse(response.body), root_entity_wrap
      end

      def test_get_collection
        collection_size.times { setup_get_entity_request }

        get collection_path, as: :json

        assert_response :ok
        assert_response_collection JSON.parse(response.body), root_collection_wrap
      end

      def test_post_entity_success
        post collection_path, params: { model: dummy_attrs }, as: :json

        assert_response :created
        assert_response_entity JSON.parse(response.body), root_entity_wrap
      end

      def test_post_entity_failure
        post collection_path, params: { model: dummy_invalid_attrs }, as: :json

        assert_response :unprocessable_entity
        assert_response_error JSON.parse(response.body)
      end

      private

      def setup_get_entity_request
        @entity = model_class.create(**dummy_attrs)
      end

      attr_reader :entity

      def collection_size
        2
      end

      def model_class
        raise NoMethodError, __method__
      end

      def root_entity_wrap
        'dummy'
      end

      def root_collection_wrap
        'dummy_collection'
      end

      def entity_path
        raise NoMethodError, __method__
      end

      def collection_path
        raise NoMethodError, __method__
      end
    end
  end
end
