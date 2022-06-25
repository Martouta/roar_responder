# frozen_string_literal: true

module RoarResponder
  module ControllerRespondable
    extend ActiveSupport::Concern

    included do
      class_attribute :represents
      self.responder = RoarResponder::Responder
    end
  end
end
