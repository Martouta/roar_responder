# frozen_string_literal: true

Rails.application.routes.draw do
  %w[class_spec instance].each do |ns|
    namespace ns do
      resources :active_record, only: %i[create index show]
      resources :mongo, only: %i[create index show]
      resources :poro, only: %i[create index show]
    end
  end

  namespace 'infer' do
    resources :poro, only: %i[show index create]
  end
end
