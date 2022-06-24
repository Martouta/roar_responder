# frozen_string_literal: true

module Instance
  class PoroController < InstanceController
    private

    def record_class
      DummyPoro
    end

    def attributes
      super.merge(valid: (params[:model][:dummy_string] != 'invalid'))
    end
  end
end
