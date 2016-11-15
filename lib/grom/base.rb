require 'grom'

module Grom
  class Base
    extend Grom::GraphMapper
    extend Grom::Helpers
    extend ActiveSupport::Inflector

    def initialize(attributes)
      attributes.each do |k,v|
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

    def self.has_many(*args)
      args.each do |arg|
        self.class_eval("def #{arg}(optional=nil); #{arg.to_s.chop.capitalize}.has_many_query(self, optional); end")
      end
    end

    def self.has_many_through(arg, word)
      self.has_many(word)
      self.class_eval("def #{arg}; #{arg.to_s.chop.capitalize}.has_many_through_query(self, #{word.to_s.chop.capitalize}.new({}).class.name); end")
    end

    def self.has_many_query(owner_object, optional=nil)
      endpoint_url = url_builder(owner_object, self.name, optional)
      # id = associated_class.id
      # associated_class = associated_class.class.name.downcase.chop + 'ies'
      # this_class = self.name.downcase + 's'
      # endpoint_url = "#{API_ENDPOINT}/#{associated_class}/#{id}/#{this_class}"
      # endpoint_url = optional.nil? ? endpoint_url + '.ttl' : endpoint_url + "/#{optional}.ttl"
      graph_data = get_graph_data(endpoint_url)
      self.all(graph_data)
    end

    def self.has_many_through_query(associated_class, through_class)
      id = associated_class.id
      associated_class_plural = pluralize(associated_class.class.name.downcase)
      this_class_plural = pluralize(self.name.downcase)
      through_property_plural = pluralize(through_class.downcase)
      endpoint_url = "#{API_ENDPOINT}/#{associated_class_plural}/#{id}/#{this_class_plural}.ttl"
      graph_data = get_graph_data(endpoint_url)
      two_graphs = split_subject(graph_data, self.name)
      this_class_array = self.all(two_graphs[:graph_one])
      this_class_array.each do |single|
        get_associated_graphs(two_graphs[:graph], single.id).map do |graph|
          single.send(through_property_plural.to_sym) << through_class.constantize.find(graph)
        end
      end
    end
  end
end