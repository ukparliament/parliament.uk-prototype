require 'grom'
require_relative '../../lib/grom/helpers'

module Grom
  class Base
    extend Grom::GraphMapper
    extend Grom::Helpers
    extend ActiveSupport::Inflector

    def initialize(attributes)
      attributes.each do |k, v|
        translated_key = self.class.property_translator[k]
        instance_variable_set("@#{translated_key}", v) unless v.nil?
        self.class.send(:attr_reader, translated_key)
      end
    end

    def self.find(graph)
      self.all(graph).first
    end

    def self.all(graph)
      self.statements_mapper_by_subject(graph).map do |data|
        self.new(data)
      end
    end

    def self.has_many(association)
      self.class_eval("def #{association}(optional=nil); #{create_class_name(association)}.has_many_query(self, optional); end")
    end

    def self.has_many_through(association, through_association)
      self.has_many(through_association)
      self.class_eval("def #{association}; #{create_class_name(association)}.has_many_through_query(self, #{create_class_name(through_association)}.new({}).class.name); end")
    end

    def self.has_many_query(owner_object, optional=nil)
      endpoint_url = url_builder(owner_object, self.name, optional)
      graph_data = get_graph_data(endpoint_url)
      self.all(graph_data)
    end

    def self.has_many_through_query(owner_object, through_class, optional=nil)
      endpoint_url = url_builder(owner_object, self.name, optional)
      graph_data = get_graph_data(endpoint_url)
      separated_graphs = split_by_subject(graph_data, self.name)
      associated_objects_array = self.all(separated_graphs[:associated_class_graph])
      through_property_plural = create_property_name(through_class)
      self.through_getter_setter(through_property_plural)
      associated_objects_array.each do |associated_object|
        through_class_array = get_through_graphs(separated_graphs[:through_graph], associated_object.id).map do |graph|
          through_class.constantize.find(graph)
        end
        associated_object.send((through_property_plural + '=').to_sym, through_class_array)
      end
    end

    def self.through_getter_setter(through_property_plural)
      self.class_eval("def #{through_property_plural}=(array); @#{through_property_plural} = array; end")
      self.class_eval("def #{through_property_plural}; @#{through_property_plural}; end")
    end

  end
end