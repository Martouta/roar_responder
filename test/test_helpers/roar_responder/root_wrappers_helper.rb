# frozen_string_literal: true

module RoarResponder
  module TestHelpers
    module RootWrappersHelper
      def root_entity_wrap
        return 'dummy' unless route_namespace == 'infer'

        "dummy_#{orm_type}_infer"
      end

      def root_collection_wrap
        return 'dummy_collection' unless route_namespace == 'infer'

        "dummy_#{orm_type}_collection_infer"
      end

      def orm_type
        raise NoMethodError, __method__
      end
    end
  end
end
ActionDispatch::IntegrationTest.include ::RoarResponder::TestHelpers::RootWrappersHelper
