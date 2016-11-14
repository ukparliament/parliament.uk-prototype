require 'grom'

module Grom
  class Base
    extend Grom::GraphMapper
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

    def self.has_many_through(*args)
      args.each do |arg|
        self.class_eval("def #{arg}(through_class); #{arg.to_s.chop.capitalize}.has_many_through_query(self, through_class); end")
      end
    end

    def self.has_many_query(associated_class, optional=nil)
      id = associated_class.id
      associated_class = associated_class.class.name.downcase.chop + 'ies'
      this_class = self.name.downcase + 's'
      endpoint_url = "#{API_ENDPOINT}/#{associated_class}/#{id}/#{this_class}"
      endpoint_url = optional.nil? ? endpoint_url + '.ttl' : endpoint_url + "/#{optional}.ttl"
      graph_data = get_graph_data(endpoint_url)
      self.all(graph_data)
    end

    def self.has_many_through_query(associated_class, through_class)
      id = associated_class.id
      associated_class_name = associated_class.class.name.downcase.chop + 'ies'
      this_class = self.name.downcase + 's'
      through_class = through_class.class.name
      endpoint_url = "#{API_ENDPOINT}/#{associated_class_name}/#{id}/#{this_class}.ttl"
      graph_data = get_graph_data(endpoint_url)
      two_graphs = split_subject(graph_data, self.name)
      people = self.all(two_graphs[:graph_one])
      array = []
      people.each do |person|
        array = get_associated_graphs(two_graphs[:graph], person.id)
      end
      # people.each do |person|
      #   person.sittings.map do |sitting|
      #     Sitting.find(sitting)
      #   end
      # end
      array.each do |arr|
        p arr[0].each do |s|
          p s
        end
      end
    end
  end
end