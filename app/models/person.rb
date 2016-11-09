require 'graph_mapper'

class Person
  extend Grom::GraphMapper


  # attr_reader:

  def initialize(attributes)
    # @id = attributes["id"]
    # @forename = attributes["forename"]
    # @middle_name = attributes["middle_name"]
    # @surname = attributes["surname"]


    attributes.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
      self.class.send(:attr_reader, k)
    end

    # The above might be useful in the future when there are more attributes
  end

  def self.all(graph)
    self.statements_mapper_by_subject(graph).map do |person_data|
      self.new(person_data)
    end
  end

end