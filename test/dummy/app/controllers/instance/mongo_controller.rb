# frozen_string_literal: true

module Instance
  class MongoController < ApplicationController
    def show
      entity = DummyMongoModel.find(params[:id])
      respond_with entity, representer_class: DummyRepresenter
    end

    def index
      collection = DummyMongoModel.all
      respond_with collection, representer_class: DummyCollectionRepresenter
    end

    def create
      attributes = params[:model].permit!.to_h.symbolize_keys
      entity = DummyMongoModel.create(**attributes)
      respond_with entity, representer_class: DummyRepresenter
    end
  end
end
