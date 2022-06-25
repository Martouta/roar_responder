# frozen_string_literal: true

class DummyActiveRecordModelCollectionRepresenter < DummyCollectionRepresenter
  self.representation_wrap = :dummy_active_record_collection_infer
end
