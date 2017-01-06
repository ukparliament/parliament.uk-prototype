class PeopleController < ApplicationController

  def index
    @people = order_list(Person.all, :surname, :forename)

    format({ serialized_data: @people })
  end

  def show
    @person = Person.eager_find(params[:id]) or not_found
    @constituencies = @person.constituencies
    @parties = @person.parties
    @contact_points = @person.contact_points
    @sittings = @person.sittings
    @houses =  @person.houses
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

  def current_party
    @person = Person.find(params[:person_id]) or not_found
    @party = @person.parties('current').first

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
