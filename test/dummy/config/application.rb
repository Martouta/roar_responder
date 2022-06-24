# frozen_string_literal: true

require 'rails'
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'rails/test_unit/railtie'

Bundler.require(*Rails.groups)

module Dummy
  class Application < Rails::Application
    config.load_defaults 6.1
  end
end
