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
end
