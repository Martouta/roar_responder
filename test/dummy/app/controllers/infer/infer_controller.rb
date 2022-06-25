# frozen_string_literal: true

module Infer
  class InferController < ApplicationController
    def show
      respond_with find_entity
    end

    def create
      respond_with new_entity
    end

    private

    def find_entity
      record_class.find(params[:id])
    end

    def new_entity
      record_class.create(**attributes)
    end

    def attributes
      params[:model].permit!.to_h.symbolize_keys
    end
  end
end
