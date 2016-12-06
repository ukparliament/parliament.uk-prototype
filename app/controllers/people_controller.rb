class PeopleController < ApplicationController

  def index
    @people = order_list(Person.all, :surname, :forename)

    format({ serialized_data: @people })
  end

  def show
    @person = Person.find(params[:id])

    format({ serialized_data: @person })
  end

  def members
    @people = order_list(Person.all('members'), :surname, :forename)

    format({ serialized_data: @people })
  end

  def current_members
    @people = order_list(Person.all('members', 'current'), :surname, :forename)

    format({ serialized_data: @people })
  end

  def contact_points
    @person = Person.find(params[:person_id])
    @contact_points = @person.contact_points

    format({ serialized_data: { person: @person, contact_points: @contact_points } })
  end

  def parties
    @person = Person.find(params[:person_id])
    @parties = order_list(@person.parties, :name)

    format({ serialized_data: { person: @person, parties: @parties } })
  end

  def current_parties
    @person = Person.find(params[:person_id])
    @parties = @person.parties('current')

    format({ serialized_data: { person: @person, parties: @parties } })
  end

  def constituencies
    @person = Person.find(params[:person_id])
    @constituencies = order_list(@person.constituencies, :name)

    format({ serialized_data: { person: @person, contact_points: @constituencies } })
  end

  def letters
    letter = params[:letter]
    @people = order_list(Person.all(letter), :surname, :forename)

    format({ serialized_data: @people })

    render "index"
  end

  def members_letters
    letter = params[:letter]
    @people = order_list(Person.all('members', letter), :surname, :forename)

    format({ serialized_data: @people })

    render "members"
  end

  def current_members_letters
    letter = params[:letter]
    @people = order_list(Person.all('members', 'current', letter), :surname, :forename)

    format({ serialized_data: @people })

    render "members"
  end
end
