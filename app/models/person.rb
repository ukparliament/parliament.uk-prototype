require 'graph_serializer'

class Person
  extend GraphSerializer

  attr_accessor :forename, :id

  def initialize(attributes)
    # @id = attributes["id"]
    # @forename = attributes["forename"]
    # @middle_name = attributes["middle_name"]
    # @surname = attributes["surname"]


    attributes.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end

    # The above might be useful in the future when there are more attributes
  end

  def self.all(graph)
    self.statements_mapper_by_subject(graph).map do |person_data|
      self.new(person_data)
    end
  end

end