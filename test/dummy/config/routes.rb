# frozen_string_literal: true

Rails.application.routes.draw do
  namespace 'class_spec' do
    resources :active_record, only: %i[create index show]
    resources :mongo, only: %i[create index show]
    resources :poro, only: %i[create index show]
  end

  namespace 'infer' do
    resources :poro, only: %i[show index create]
  end

  namespace 'instance' do
    resources :active_record, only: %i[create index show]
    resources :mongo, only: %i[create index show]
    resources :poro, only: %i[create index show]
  end
end
