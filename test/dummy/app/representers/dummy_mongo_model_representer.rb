# frozen_string_literal: true

class DummyMongoModelRepresenter < DummyRepresenter
  self.representation_wrap = :dummy_mongo_infer
end
