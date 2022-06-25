# frozen_string_literal: true

module Infer
  class InferController < ApplicationController
    def show
      respond_with find_entity
    end

    private

    def find_entity
      record_class.find(params[:id])
    end
  end
end
