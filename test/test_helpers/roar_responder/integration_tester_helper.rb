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

      ORM_MODEL_CLASS = {
        'active_record' => DummyActiveRecordModel,
        'mongo' => DummyMongoModel,
        'poro' => DummyPoro
      }.freeze

      def setup_get_entity_request
        model_class = ORM_MODEL_CLASS[orm_type]
        @entity = model_class.create(**dummy_attrs)
      end

      attr_reader :entity

      def collection_size
        2
      end

      def root_entity_wrap
        'dummy'
      end

      def root_collection_wrap
        'dummy_collection'
      end

      def entity_path
        public_send("#{route_namespace}_#{orm_type}_path", entity)
      end

      def collection_path
        public_send("#{route_namespace}_#{orm_type}_index_path")
      end

      def route_namespace
        self.class.name.match(/\w+::(\w+)::\w+/)[1].underscore
      end

      def orm_type
        self.class.name.match(/\w+::\w+::(\w+)/)[1].underscore.sub('_test', '')
      end
    end
  end
end
