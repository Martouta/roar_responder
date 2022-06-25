# frozen_string_literal: true

module ClassSpec
  class MongoController < ClassSpecController
    private

    def record_class
      DummyMongoModel
    end
  end
end
