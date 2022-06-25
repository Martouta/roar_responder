# frozen_string_literal: true

class DummyPoros
  include Enumerable
  extend ActiveModel::Naming

  def initialize(original_collection)
    @original_collection = original_collection
  end

  delegate :each, to: :original_collection

  private

  attr_reader :original_collection
end
