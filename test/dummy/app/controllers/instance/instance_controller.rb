# frozen_string_literal: true

module Instance
  class InstanceController < ApplicationController
    def show
      respond_with find_entity, representer_class: DummyRepresenter
    end

    def index
      respond_with collection, representer_class: DummyCollectionRepresenter
    end

    def create
      respond_with new_entity, representer_class: DummyRepresenter
    end

    private

    def find_entity
      record_class.find(params[:id])
    end

    def collection
      record_class.all
    end

    def new_entity
      record_class.create(**attributes)
    end

    def attributes
      params[:model].permit!.to_h.symbolize_keys
    end
  end
end
