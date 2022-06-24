# frozen_string_literal: true

ActiveRecord::Schema.define(version: 0) do
  enable_extension 'plpgsql'

  create_table 'dummy_active_record_model', force: :cascade do |t|
    t.string 'dummy_string'
    t.integer 'dummy_integer'
    t.datetime 'created_at', precision: 6, null: false
  end
end
