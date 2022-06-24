# frozen_string_literal: true

module RoarResponder
  module TestHelpers
    module AssertResponseHelper
      def assert_response_entity(response_entity)
        response_id = response_entity.dig('dummy', 'id')
        assert response_id.present?
        assert_equal dummy_attrs[:dummy_integer], response_entity.dig('dummy', 'dummy_integer')
        assert_equal dummy_attrs[:dummy_string], response_entity.dig('dummy', 'dummy_string')

        response_created_at = Time.parse(response_entity['dummy']['created_at'])
        assert_in_delta Time.now, response_created_at, 2.seconds

        assert_self_link(response_entity, 'dummy', "example/#{response_id}")
      end

      def assert_self_link(parsed_json, root_wrap, expected_url)
        self_link = parsed_json.dig(root_wrap, 'links', 0)
        assert_equal expected_url, self_link['href']
        assert_equal 'self', self_link['rel']
      end

      def assert_response_error(parsed_json)
        expected_response = { 'errors' => { 'dummy_string' => ['invalid'] } }
        assert_equal expected_response, parsed_json
      end

      def dummy_attrs
        { dummy_integer: 42, dummy_string: 'bar' }
      end
    end
  end
end

ActionDispatch::IntegrationTest.include ::RoarResponder::TestHelpers::AssertResponseHelper
