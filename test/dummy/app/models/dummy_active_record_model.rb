# frozen_string_literal: true

class DummyActiveRecordModel < ApplicationRecord
  self.table_name = 'dummy_active_record_model'

  validates :dummy_string, inclusion: {
    in: %w[foo bar baz],
    message: 'invalid'
  }, allow_nil: true
end
