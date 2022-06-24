# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('dummy/config/environment.rb', __dir__)

require 'rails/test_help'

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'roar_responder'

require 'minitest/autorun'
require 'database_cleaner/active_record'
require 'database_cleaner/mongoid'

Dir["#{File.dirname(__FILE__)}/test_helpers/roar_responder/**/*.rb"].sort.each { |file| require file }

module Minitest
  class Test
    def before_setup
      super
      config_db_clear_strategy
    end

    def after_teardown
      super
      clear_data
    end
  end
end
