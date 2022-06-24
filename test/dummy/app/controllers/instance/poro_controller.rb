# frozen_string_literal: true

module Instance
  class PoroController < InstanceController
    private

    def find_entity
      DummyPoro.new
    end

    def collection
      Array.new(2) { DummyPoro.new }
    end

    def new_entity
      attrs = attributes.merge(valid: (params[:model][:dummy_string] != 'invalid'))
      DummyPoro.new(**attrs)
    end
  end
end
