# frozen_string_literal: true

class DummyPoro
  include ActiveModel::Conversion # Respond to to_model
  extend ActiveModel::Naming # Respond to model_name

  def initialize(dummy_integer: 42, dummy_string: 'bar', valid: true)
    @dummy_integer = dummy_integer
    @dummy_string = dummy_string
    @created_at = Time.now
    @valid = !!valid
  end

  attr_reader :dummy_integer, :dummy_string, :created_at

  def valid?
    @valid
  end

  alias persisted? valid?

  def errors
    errors = ActiveModel::Errors.new(self)
    return errors if valid?

    errors.add(:dummy_string, 'invalid')
    errors
  end

  def id
    persisted? ? 1 : nil
  end

  class << self
    alias create new

    def find(*)
      new
    end

    def all
      Array.new(2) { new }
    end
  end
end
