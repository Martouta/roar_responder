# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ::RoarResponder::ControllerRespondable
  respond_to :json
end
