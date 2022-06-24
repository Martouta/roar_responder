# frozen_string_literal: true

module Instance
  class ActiveRecordController < ApplicationController
    def show
      entity = DummyActiveRecordModel.find(params[:id])
      respond_with entity, representer_class: DummyRepresenter
    end

    def index
      collection = DummyActiveRecordModel.all
      respond_with collection, representer_class: DummyCollectionRepresenter
    end

    def create
      attributes = params[:model].permit!.to_h.symbolize_keys
      entity = DummyActiveRecordModel.create(**attributes)
      respond_with entity, representer_class: DummyRepresenter
    end
  end
end
