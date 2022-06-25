# frozen_string_literal: true

module RoarResponder
  class Responder < ActionController::Responder
    protected

    def display(resource, given_options = {})
      represented = representer_class&.new(resource) || resource
      controller.render given_options.merge(options).merge(format => represented, location: options[:location])
    end

    def representer_class
      @representer_class ||= options[:representer_class] || representer_for_controller || infer_representer
    end

    def representer_for_controller
      (controller.represents || {})[representable_type]
    end

    def infer_representer
      if collection?
        "#{resource.model_name}_collection_representer".camelize.safe_constantize if resource.respond_to?(:model_name)
      else
        "#{resource.model_name}_representer".camelize.safe_constantize
      end
    end

    def representable_type
      collection? ? :collection : :entity
    end

    def collection?
      resource.respond_to?(:length)
    end
  end
end
