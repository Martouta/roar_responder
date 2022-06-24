# frozen_string_literal: true

require 'test_helper'

class TestRoarResponder < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RoarResponder::VERSION
  end

  class RepresentersTest < Minitest::Test
    def test_represents_entity_success
      example_attrs = { dummy_integer: 4, dummy_string: 'bar' }
  
      model = DummyPoro.new(**example_attrs)
      representer = DummyRepresenter.new(model)
      assert JSON.parse(representer.to_json)
  
      model = DummyActiveRecordModel.create(**example_attrs)
      representer = DummyRepresenter.new(model)
      assert JSON.parse(representer.to_json)
  
      model = DummyMongoModel.create(**example_attrs)
      representer = DummyRepresenter.new(model)
      assert JSON.parse(representer.to_json)
    end
  
    def test_represents_entity_error
      example_attrs = { dummy_integer: 4, dummy_string: 'invalid' }
  
      model = DummyPoro.new(**example_attrs, valid: false)
      representer = DummyRepresenter.new(model)
      assert JSON.parse(representer.to_json)
  
      model = DummyActiveRecordModel.create(**example_attrs)
      representer = DummyRepresenter.new(model)
      assert JSON.parse(representer.to_json)
  
      model = DummyMongoModel.create(**example_attrs)
      representer = DummyRepresenter.new(model)
      assert JSON.parse(representer.to_json)
    end
  
    def test_represents_collection
      example_attrs = { dummy_integer: 4, dummy_string: 'bar' }
  
      models = Array.new(2).map { DummyPoro.new(**example_attrs) }
      representer = DummyCollectionRepresenter.new(models)
      assert JSON.parse(representer.to_json)
  
      2.times { DummyActiveRecordModel.create(**example_attrs) }
      representer = DummyCollectionRepresenter.new(DummyActiveRecordModel.all)
      assert JSON.parse(representer.to_json)
  
      2.times { DummyMongoModel.create(**example_attrs) }
      representer = DummyCollectionRepresenter.new(DummyMongoModel.all)
      assert JSON.parse(representer.to_json)
    end
  end

  class IntegrationTest < ActionDispatch::IntegrationTest
    def test_class_routes
      skip 'TODO WIP'
      get class_active_record_entity_path, as: :json
      assert_response :ok
      assert_equal '{}', response.body

      get class_active_record_collection_path, as: :json
      assert_response :ok
      assert_equal '{}', response.body

      post class_active_record_entity_path, params: {}, as: :json
      # assert_response :created
      assert_equal '{}', response.body

      get class_mongo_entity_path, as: :json
      assert_response :ok
      assert_equal '{}', response.body

      get class_mongo_collection_path, as: :json
      assert_response :ok
      assert_equal '{}', response.body

      post class_mongo_entity_path, params: {}, as: :json
      # assert_response :created
      assert_equal '{}', response.body

      get class_poro_entity_path, as: :json
      assert_response :ok
      assert_equal '{}', response.body

      get class_poro_collection_path, as: :json
      assert_response :ok
      assert_equal '{}', response.body

      post class_poro_entity_path, params: {}, as: :json
      # assert_response :created
      assert_equal '{}', response.body

      # TODO: create error case !!
    end

    def test_infer_routes
      skip 'TODO WIP'
      get infer_active_record_entity_path, as: :json
      assert_response :ok
      assert_equal '{}', response.body

      get infer_active_record_collection_path, as: :json
      assert_response :ok
      assert_equal '{}', response.body

      post infer_active_record_entity_path, params: {}, as: :json
      # assert_response :created
      assert_equal '{}', response.body

      get infer_mongo_entity_path, as: :json
      assert_response :ok
      assert_equal '{}', response.body

      get infer_mongo_collection_path, as: :json
      assert_response :ok
      assert_equal '{}', response.body

      post infer_mongo_entity_path, params: {}, as: :json
      # assert_response :created
      assert_equal '{}', response.body

      get infer_poro_entity_path, as: :json
      assert_response :ok
      assert_equal '{}', response.body

      get infer_poro_collection_path, as: :json
      assert_response :ok
      assert_equal '{}', response.body

      post infer_poro_entity_path, params: {}, as: :json
      # assert_response :created
      assert_equal '{}', response.body

      # TODO: create error case !!
    end

    def test_instance_routes
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

      # get instance_active_record_collection_path, as: :json
      # assert_response :ok
      # assert_equal '{}', response.body

      # post instance_active_record_entity_path, params: {}, as: :json
      # # assert_response :created
      # assert_equal '{}', response.body

      # get instance_mongo_entity_path, as: :json
      # assert_response :ok
      # assert_equal '{}', response.body

      # get instance_mongo_collection_path, as: :json
      # assert_response :ok
      # assert_equal '{}', response.body

      # post instance_mongo_entity_path, params: {}, as: :json
      # # assert_response :created
      # assert_equal '{}', response.body

      # get instance_poro_entity_path, as: :json
      # assert_response :ok
      # assert_equal '{}', response.body

      # get instance_poro_collection_path, as: :json
      # assert_response :ok
      # assert_equal '{}', response.body

      # post instance_poro_entity_path, params: {}, as: :json
      # # assert_response :created
      # assert_equal '{}', response.body

      # # TODO: create error case !!
    end
  end
end
