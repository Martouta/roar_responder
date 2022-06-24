# frozen_string_literal: true

module Instance
  class PoroController < ApplicationController
    def show
      entity = DummyPoro.new
      respond_with entity, representer_class: DummyRepresenter
    end

    def index
      collection = Array.new(2) { DummyPoro.new }
      respond_with collection, representer_class: DummyCollectionRepresenter
    end

    def create
      entity = DummyPoro.new(dummy_string: params[:model][:dummy_string],
                             valid: (params[:model][:dummy_string] != 'invalid'))
      respond_with entity, representer_class: DummyRepresenter
    end
  end
end
