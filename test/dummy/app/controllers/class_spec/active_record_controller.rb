# frozen_string_literal: true

module ClassSpec
  class ActiveRecordController < ClassSpecController
    private

    def record_class
      DummyActiveRecordModel
    end
  end
end
