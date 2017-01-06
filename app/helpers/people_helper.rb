module PeopleHelper

  def person_display_name(person)
    person.display_name.nil? ? "No Information" : person.display_name
  end

  def house_link(house)
    defined?(house.id) ? link_to(house.id, house_path(house.id)) : "No Information"
  end
end
