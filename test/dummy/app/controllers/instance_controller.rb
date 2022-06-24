# frozen_string_literal: true

class InstanceController < ApplicationController
  def get_active_record_entity
    entity = DummyActiveRecordModel.last
    respond_with entity, representer_class: DummyRepresenter
  end

  def get_active_record_collection
    collection = DummyActiveRecordModel.all
    respond_with collection, representer_class: DummyCollectionRepresenter
  end

  def post_active_record_entity
    attributes = params[:model].permit!.to_h.symbolize_keys
    entity = DummyActiveRecordModel.create(**attributes)
    respond_with entity, representer_class: DummyRepresenter
  end

  def get_mongo_entity
    entity = DummyMongoModel.last
    respond_with entity, representer_class: DummyRepresenter
  end

  def get_mongo_collection
    collection = DummyMongoModel.all
    respond_with collection, representer_class: DummyCollectionRepresenter
  end

  def post_mongo_entity
    attributes = params[:model].permit!.to_h.symbolize_keys
    entity = DummyMongoModel.create(**attributes)
    respond_with entity, representer_class: DummyRepresenter
  end

  def get_poro_entity
    render json: {}
  end

  def post_poro_entity
    render json: {}
  end

  def get_poro_collection
    render json: {}
  end
end
