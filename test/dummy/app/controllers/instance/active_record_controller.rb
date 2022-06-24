# frozen_string_literal: true

module Instance
  class ActiveRecordController < InstanceController
    private
    
    def find_entity
      DummyActiveRecordModel.find(params[:id])
    end

    def collection
      DummyActiveRecordModel.all
    end

    def new_entity
      attributes = params[:model].permit!.to_h.symbolize_keys
      DummyActiveRecordModel.create(**attributes)
    end
  end
end
