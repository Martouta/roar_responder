# frozen_string_literal: true

class DummyCollectionRepresenter < ApplicationRepresenter
  include Roar::Hypermedia

  self.representation_wrap = :dummy_collection

  link :self do
    '/collection'
  end

  collection :to_a, as: :items, decorator: DummyRepresenter
end
