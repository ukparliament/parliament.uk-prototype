require 'grom'

module Grom
  module Helpers

    def url_builder(owner_object, associated_class_name, optional=nil)
      id = owner_object.id
      owner_class_name_plural = create_property_name(owner_object.class.name)
      associated_class_name_plural = create_property_name(associated_class_name)
      endpoint = "#{API_ENDPOINT}/#{owner_class_name_plural}/#{id}/#{associated_class_name_plural}"
      endpoint += optional.nil? ? '.ttl' : "/#{optional}.ttl"
    end

    def create_class_name(plural_name)
      ActiveSupport::Inflector.camelize(ActiveSupport::Inflector.singularize(plural_name.to_s).capitalize)
    end

    def create_property_name(class_name)
      ActiveSupport::Inflector.pluralize(ActiveSupport::Inflector.underscore(class_name).downcase)
    end
  end
end