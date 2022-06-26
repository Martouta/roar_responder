# frozen_string_literal: true

Rails.application.routes.draw do
  %w[class_spec infer instance].each do |ns|
    namespace ns do
      %i[active_record mongo poro].each do |orm|
        resources orm, only: %i[create index show]
      end
    end
  end

  get 'default_serialization', to: 'default_serialization#simple'
end
