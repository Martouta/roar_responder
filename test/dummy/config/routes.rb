# frozen_string_literal: true

Rails.application.routes.draw do
  get '/class/active_record_entity', to: 'class#get_active_record_entity'
  post '/class/active_record_entity', to: 'class#post_active_record_entity'
  get '/class/active_record_collection', to: 'class#get_active_record_collection'

  get '/class/mongo_entity', to: 'class#get_mongo_entity'
  post '/class/mongo_entity', to: 'class#post_mongo_entity'
  get '/class/mongo_collection', to: 'class#get_mongo_collection'

  get '/class/poro_entity', to: 'class#get_poro_entity'
  post '/class/poro_entity', to: 'class#post_poro_entity'
  get '/class/poro_collection', to: 'class#get_poro_collection'

  get '/infer/active_record_entity', to: 'infer#get_active_record_entity'
  post '/infer/active_record_entity', to: 'infer#post_active_record_entity'
  get '/infer/active_record_collection', to: 'infer#get_active_record_collection'

  get '/infer/mongo_entity', to: 'infer#get_mongo_entity'
  post '/infer/mongo_entity', to: 'infer#post_mongo_entity'
  get '/infer/mongo_collection', to: 'infer#get_mongo_collection'

  get '/infer/poro_entity', to: 'infer#get_poro_entity'
  post '/infer/poro_entity', to: 'infer#post_poro_entity'
  get '/infer/poro_collection', to: 'infer#get_poro_collection'

  namespace 'instance' do
    resources :active_record, only: %i[create index show]
    resources :mongo, only: %i[create index show]
    resources :poro, only: %i[create index show]
  end
end
