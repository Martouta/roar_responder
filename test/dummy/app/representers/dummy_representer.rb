# frozen_string_literal: true

class DummyRepresenter < ApplicationRepresenter
  include Roar::Hypermedia

  self.representation_wrap = :dummy

  with_options(if: ->(*) { persisted? }) do
    property :id
    property :dummy_integer
    property :dummy_string
    property :created_at
  end

  link :self do
    "example/#{represented.id}"
  end

  property :errors, if: ->(*) { errors.any? }
end
