# frozen_string_literal: true

require_relative 'lib/roar_responder/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = '>= 2.6'

  spec.name        = 'roar_responder'
  spec.version     = RoarResponder::VERSION
  spec.authors     = ['Marta Noya']

  spec.summary = 'Render roar representers as responses in Rails'
  spec.description = <<~EOF
    Use roar representers with respond_with in a way that you can easily use multiple representers for the same model and for the same controller but without being mandatory.
    Support ActiveRecord, Mongoid, and any Ruby object that responds to `to_model` and `model_name`.
  EOF
  spec.homepage = 'https://github.com/Martouta/roar_responder'

  spec.metadata = {
    'homepage_uri' => spec.homepage,
    'source_code_uri' => spec.homepage,
    'rubygems_mfa_required' => 'true'
  }

  spec.files = Dir['lib}/**/*', 'Rakefile', 'LICENSE']
  spec.require_paths = ['lib']

  spec.add_dependency 'multi_json', '~> 1.15.0'
  spec.add_dependency 'rails', '>= 5.2', '< 7.1'
  spec.add_dependency 'responders', '~> 3.0'
  spec.add_dependency 'roar', '~> 1.1.0'

  spec.add_development_dependency 'database_cleaner-active_record', '~> 2.0.1'
  spec.add_development_dependency 'database_cleaner-mongoid', '~> 2.0.1'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'mongoid', '~> 7.3.4'
  spec.add_development_dependency 'pg', '~> 1.2.3'
end
