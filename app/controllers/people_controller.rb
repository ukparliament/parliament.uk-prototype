class PeopleController < ApplicationController

  def index
    @people = Person.all
    @people.sort! { |a,b| a.surname.downcase <=> b.surname.downcase }

    format({ serialized_data: @people })
  end

  def show
    @person = Person.find(params[:id])

    format({ serialized_data: @person })
  end

  def members
    @people = Person.all('members')

    format({ serialized_data: @people })
  end

  def current_members
    @people = Person.all('members', 'current')

    format({ serialized_data: @people })
  end

  def contact_points
    @person = Person.find(params[:person_id])
    @contact_points = @person.contact_points

    format({ serialized_data: { person: @person, contact_points: @contact_points } })
  end

  def parties
    @person = Person.find(params[:person_id])
    @parties = @person.parties

    format({ serialized_data: { person: @person, parties: @parties } })
  end

  def current_parties
    @person = Person.find(params[:person_id])
    @parties = @person.parties('current')

    format({ serialized_data: { person: @person, parties: @parties } })
  end

  def constituencies
    @person = Person.find(params[:person_id])
    @constituencies = @person.constituencies

    format({ serialized_data: { person: @person, contact_points: @constituencies } })
  end
end
