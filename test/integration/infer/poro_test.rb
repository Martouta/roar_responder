# frozen_string_literal: true

require 'test_helper'

module Integration
  module Infer
    class PoroTest < ActionDispatch::IntegrationTest
      def test_get_entity
        get infer_poro_path(id: 1), as: :json

        assert_response :ok
        assert_response_entity JSON.parse(response.body), 'dummy_poro_infer'
      end
    end
  end
end
