module PeopleHelper

  def person_display_name(person)
    person.display_name.nil? ? "No Information" : person.display_name
  end

  def house_link(sittings)
    !sittings.nil? && defined?(house.id) ? link_to(house.id, house_path(house.id)) : "No Information"
  end

  def party_link(party_memberships)
    !party_memberships.nil? && defined?(party_memberships.first.party) ? link_to(party_memberships.first.party.name, party_path(party_memberships.first.party.id)) : "No Information"
  end

  def constituency_link(sittings)
    !sittings.nil? && defined?(sittings.first.constituency.name) ? link_to(sittings.first.constituency.name, constituency_path(sittings.first.constituency.id)) : "No Information"
  end

  def is_mp?(person)
    !person.sittings.nil? && person.sittings.first.house.id == 'HouseOfCommons'
  end

  def parliamentary_email(contact_points)
    !contact_points.nil? && defined?(contact_points.first.email) ? contact_points.first.email : "No Information"
  end

  def parliamentary_phone(contact_points)
    !contact_points.nil? && defined?(contact_points.first.telephone) ? contact_points.first.telephone : "No Information"
  end

  def parliamentary_address(contact_points)
    !contact_points.nil? && !contact_points.first.full_address.nil? ? contact_points.first.full_address : "No Information"
  end
end
