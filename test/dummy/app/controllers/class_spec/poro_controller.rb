# frozen_string_literal: true

module ClassSpec
  class PoroController < ClassSpecController
    private

    def record_class
      DummyPoro
    end

    def attributes
      super.merge(valid: (params[:model][:dummy_string] != 'invalid'))
    end
  end
end
