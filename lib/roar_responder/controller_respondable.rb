# frozen_string_literal: true

module RoarResponder
  module ControllerRespondable
    extend ActiveSupport::Concern

    included do
      self.responder = RoarResponder::Responder
    end
  end
end
