# frozen_string_literal: true

module Infer
  class PoroController < InferController
    include PoroControllable

    def collection
      array = record_class.all
      DummyPoros.new(array)
    end
  end
end
