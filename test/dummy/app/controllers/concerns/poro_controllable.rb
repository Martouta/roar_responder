# frozen_string_literal: true

module PoroControllable
  extend ActiveSupport::Concern

  included do
    def record_class
      DummyPoro
    end

    def attributes
      super.merge(valid: (params[:model][:dummy_string] != 'invalid'))
    end
  end
end
