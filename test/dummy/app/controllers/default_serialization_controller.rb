# frozen_string_literal: true

class DefaultSerializationController < ApplicationController
  def simple
    respond_with SimpleModel.new
  end
end
