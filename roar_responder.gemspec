# frozen_string_literal: true

require_relative 'lib/roar_responder/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = '>= 2.6.0'

  spec.name        = 'roar_responder'
  spec.version     = RoarResponder::VERSION
  spec.authors     = ['Marta Noya']

  spec.summary = 'TODO: Write a short summary, because RubyGems requires one.'
  spec.description = 'TODO: Write a longer description or delete this line.'
  spec.homepage = 'https://github.com/Martouta/roar_responder'

  spec.metadata = {
    'homepage_uri' => spec.homepage,
    'source_code_uri' => spec.homepage,
    'rubygems_mfa_required' => 'true'
  }

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split('\x0').reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.require_paths = ['lib']
end
