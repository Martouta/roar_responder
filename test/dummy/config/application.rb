# frozen_string_literal: true

require 'rails'
require 'mongoid'
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'rails/test_unit/railtie'

Bundler.require(*Rails.groups)

module Dummy
  class Application < Rails::Application
    rails_version_path = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '.rails-version'))
    rails_version = File.read(rails_version_path).strip.to_f
    config.load_defaults(rails_version < 7.0 ? rails_version : 6.1)
  end
end
