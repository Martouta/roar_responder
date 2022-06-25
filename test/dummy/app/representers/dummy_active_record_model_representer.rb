# frozen_string_literal: true

class DummyActiveRecordModelRepresenter < DummyRepresenter
  self.representation_wrap = :dummy_active_record_infer
end
