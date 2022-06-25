# frozen_string_literal: true

module Infer
  class MongoController < InferController
    private

    def record_class
      DummyMongoModel
    end
  end
end
