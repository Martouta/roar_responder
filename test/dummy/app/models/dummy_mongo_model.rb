# frozen_string_literal: true

class DummyMongoModel
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  store_in collection: 'dummy_mongo_model'

  field :dummy_integer, type: Integer
  field :dummy_string, type: String

  validates :dummy_string, inclusion: {
    in: %w[foo bar baz],
    message: 'invalid'
  }, allow_nil: true

  def id
    _id.to_s
  end
end
