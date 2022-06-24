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
  end
end
