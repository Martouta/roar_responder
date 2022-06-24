# frozen_string_literal: true

module Instance
  class MongoController < InstanceController
    private

    def record_class
      DummyMongoModel
    end
  end
end
