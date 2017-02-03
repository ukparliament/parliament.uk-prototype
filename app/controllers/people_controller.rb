class PeopleController < ApplicationController

  def index
    # @people = order_list(Person.all, :surname, :forename)
    #
    # format({ serialized_data: @people })
  end

  def show
    # @person = Person.eager_find(params[:id]) or not_found
    #
    # @sittings = order_list(@person.sittings, :start_date).reverse unless @person.sittings.nil?
    # @party_memberships = order_list(@person.party_memberships, :start_date).reverse
    #
    # format({ serialized_data: @person })
  end

  def members
    # @people = order_list(Person.eager_all('members'), :surname, :forename)
    #
    # format({ serialized_data: @people })
  end

  def current_members
    # @people = order_list(Person.eager_all('members', 'current'), :surname, :forename)
    #
    # format({ serialized_data: @people })
  end

  def contact_points
    # @person = Person.eager_find(params[:person_id], 'contact_points') or not_found
    #
    # format({ serialized_data: @person })
  end

  def parties
    # @person = Person.eager_find(params[:person_id], 'parties') or not_found
    # @parties = order_list(@person.parties, :name)
    #
    # format({ serialized_data: @person })
  end

  def current_party
    # @person = Person.eager_find(params[:person_id] ,'parties', 'current') or not_found
    #
    # format({ serialized_data: @person })
  end

  def constituencies
    # @person = Person.eager_find(params[:person_id], 'constituencies') or not_found
    # @constituencies = order_list(@person.constituencies, :name)
    #
    # format({ serialized_data: @person })
  end

  def current_constituency
    # @person = Person.eager_find(params[:person_id], 'constituencies', 'current') or not_found
    # @constituency = @person.constituencies.first
    #
    # format({ serialized_data: @person })
  end

  def houses
    # @person = Person.eager_find(params[:person_id], 'houses') or not_found
    #
    # format({ serialized_data: @person })
  end

  def current_house
    # @person = Person.eager_find(params[:person_id], 'houses', 'current') or not_found
    # @house = @person.houses.first
    #
    # format({ serialized_data: @person })
  end

  def letters
    # letter = params[:letter]
    # @root_path = people_a_z_path
    # @people = order_list(Person.all(letter), :surname, :forename)
    #
    # format({ serialized_data: @people })
  end

  def members_letters
    # letter = params[:letter]
    # @root_path = people_members_a_z_path
    # @people = order_list(Person.eager_all('members', letter), :surname, :forename)
    #
    # format({ serialized_data: @people })
  end

  def current_members_letters
    # letter = params[:letter]
    # @root_path = people_members_current_a_z_path
    # @people = order_list(Person.eager_all('members', 'current', letter), :surname, :forename)
    #
    # format({ serialized_data: @people })
  end
end
