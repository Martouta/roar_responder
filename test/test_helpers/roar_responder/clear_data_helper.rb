# frozen_string_literal: true

module RoarResponder
  module TestHelpers
    module ClearDataHelper
      def config_db_clear_strategy
        DatabaseCleaner[:active_record].strategy = :truncation
        DatabaseCleaner[:mongoid].strategy = :deletion
      end

      def clear_data
        DatabaseCleaner.clean
      end
    end
  end
end

ActiveSupport::TestCase.include ::RoarResponder::TestHelpers::ClearDataHelper
