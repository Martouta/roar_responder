# frozen_string_literal: true

class DummyMongoModelCollectionRepresenter < DummyCollectionRepresenter
  self.representation_wrap = :dummy_mongo_collection_infer
end
