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
      model_name = resource.try(:model_name)
      return unless model_name

      representer_name = "#{resource.model_name}#{"Collection" if collection?}Representer"
      representer_name.safe_constantize
    end

    def representable_type
      collection? ? :collection : :entity
    end

    def collection?
      resource.respond_to?(:length)
    end
  end
end
