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
      entity = DummyPoro.new(dummy_string: params[:model][:dummy_string],
                             valid: (params[:model][:dummy_string] != 'invalid'))
    end
  end
end
