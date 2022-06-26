# frozen_string_literal: true

class DefaultSerializationController < ApplicationController
  def simple
    respond_with SimpleClass.new
  end

  class SimpleClass
    include ActiveModel::Serializers::JSON
    include ActiveModel::Conversion

    def initialize
      @foo = 'bar'
    end

    attr_reader :foo

    def attributes
      { 'foo' => 'bar' }
    end

    def persisted?
      false
    end

    def id
      nil
    end
  end
end
