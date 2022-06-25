# frozen_string_literal: true

module Infer
  class ActiveRecordController < InferController
    private

    def record_class
      DummyActiveRecordModel
    end
  end
end
