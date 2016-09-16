class Person
  attr_accessor :name, :id

  def initialize(attributes)
    @id = attributes["id"]
    @name = attributes["name"]

    # attributes.each do |k,v|
    #   instance_variable_set("@#{k}", v) unless v.nil?
    # end

    # The above might be useful in the future when there are more attributes
  end

end