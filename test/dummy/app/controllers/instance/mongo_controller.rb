# frozen_string_literal: true

module Instance
  class MongoController < InstanceController
    private
    
    def find_entity
      DummyMongoModel.find(params[:id])
    end

    def collection
      DummyMongoModel.all
    end

    def new_entity
      attributes = params[:model].permit!.to_h.symbolize_keys
      entity = DummyMongoModel.create(**attributes)
    end
  end
end
