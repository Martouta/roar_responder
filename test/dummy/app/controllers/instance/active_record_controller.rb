# frozen_string_literal: true

module Instance
  class ActiveRecordController < InstanceController
    private

    def record_class
      DummyActiveRecordModel
    end
  end
end
