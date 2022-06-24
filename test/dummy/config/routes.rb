# frozen_string_literal: true

Rails.application.routes.draw do
  namespace 'instance' do
    resources :active_record, only: %i[create index show]
    resources :mongo, only: %i[create index show]
    resources :poro, only: %i[create index show]
  end
end
