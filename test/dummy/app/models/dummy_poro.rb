# frozen_string_literal: true

require 'time'

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
end
