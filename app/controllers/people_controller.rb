class PeopleController < ApplicationController

  def index
    @people = order_list(Person.all, :surname, :forename)

    format({ serialized_data: @people })
  end

  def show
    @person = Person.find(params[:id]) or not_found

    @constituencies = @person.constituencies
    @parties = @person.parties
    @contact_points = @person.contact_points
    @sittings = order_list_by_through(@constituencies, :sittings, :sittingStartDate)
    @houses =  @person.houses

    @person_display_name = defined?(@person.display_name) ? @person.display_name : "No Information"
    @house_link = defined?(@person.houses.first.id) ? view_context.link_to(@person.houses.first.id, houses_path(@person.houses.first.id)) : "No Information"
    @party_link = defined?(@person.parties.first.id) ? view_context.link_to(@person.parties.first.name, houses_path(@person.parties.first.id)) : "No Information"
    @constituency_link = defined?(@person.constituencies.first.id) ? view_context.link_to(@constituencies.first.name, constituency_path(@person.constituencies.first.id)) : "No Information"
    @is_mp = defined?(@person.houses.first.id) ? true : false
    @parliamentary_email = defined?(@person.contact_points.first.email) ? @person.contact_points.first.email : "No Information"
    @parliamentary_phone = defined?(@person.contact_points.first.telephone) ? @person.contact_points.first.telephone : "No Information"
    @parliamentary_address = defined?(@person.contact_points.first.full_address) ? @person.contact_points.first.full_address : "No Information"

    format({ serialized_data: @person })
  end

  def members
    @people = order_list(Person.all('members'), :surname, :forename)

    format({ serialized_data: @people })
  end

  def current_members
    @people = order_list(Person.all_with('members', 'current', ['party', 'house', 'constituency']), :surname, :forename)

    format({ serialized_data: @people })
  end

  def contact_points
    @person = Person.find(params[:person_id]) or not_found
    @contact_points = @person.contact_points

    format({ serialized_data: { person: @person, contact_points: @contact_points } })
  end

  def parties
    @person = Person.find(params[:person_id]) or not_found
    @parties = order_list(@person.parties, :name)

    format({ serialized_data: { person: @person, parties: @parties } })
  end

  def current_parties
    @person = Person.find(params[:person_id]) or not_found
    @parties = @person.parties('current')

    format({ serialized_data: { person: @person, parties: @parties } })
  end

  def constituencies
    @person = Person.find(params[:person_id]) or not_found
    @constituencies = order_list(@person.constituencies, :name)

    format({ serialized_data: { person: @person, constituencies: @constituencies } })
  end

  def current_constituency
    @person = Person.find(params[:person_id]) or not_found
    @constituency = @person.constituencies('current').first

    format({ serialized_data: { person: @person, constituencies: @constituency } })
  end

  def houses
    @person = Person.find(params[:person_id]) or not_found
    @houses = @person.houses

    format({ serialized_data: { person: @person, houses: @houses }})
  end

  def current_house
    @person = Person.find(params[:person_id]) or not_found
    @house = @person.houses('current').first

    format({ serialized_data: { person: @person, house: @house } })
  end

  def letters
    letter = params[:letter]
    @root_path = people_a_z_path
    @people = order_list(Person.all(letter), :surname, :forename)

    format({ serialized_data: @people })
  end

  def members_letters
    letter = params[:letter]
    @root_path = people_members_a_z_path
    @people = order_list(Person.all('members', letter), :surname, :forename)

    format({ serialized_data: @people })
  end

  def current_members_letters
    letter = params[:letter]
    @root_path = people_members_current_a_z_path
    @people = order_list(Person.all_with('members', 'current', letter, ["constituency", "party", "house"]), :surname, :forename)

    format({ serialized_data: @people })
  end
end
