class PeopleController < ApplicationController
  def index
    @people = Parliament::Request.new.people.get
  end

  def show
    person_id = params[:person_id]
    data = Parliament::Request.new.people(person_id).get
    @person = data.filter('http://id.ukpds.org/schema/Person').first
  end

  def members
    data = Parliament::Request.new.people.members.get
    @people = data.filter('http://id.ukpds.org/schema/Person')
  end

  def current_members
    data = Parliament::Request.new.people.members.current.get
    @people = data.filter('http://id.ukpds.org/schema/Person')
  end

  def contact_points
    person_id = params[:person_id]
    data = Parliament::Request.new.people(person_id).contact_points.get
    filtered_data = data.filter('http://id.ukpds.org/schema/Person', 'http://id.ukpds.org/schema/ContactPoint')
    @person = filtered_data[0].first
    @contact_points = filtered_data[1]
  end

  def parties
    person_id = params[:person_id]
    data = Parliament::Request.new.people(person_id).parties.get
    filtered_data = data.filter('http://id.ukpds.org/schema/Person', 'http://id.ukpds.org/schema/Party')
    @person = filtered_data[0].first
    @parties = filtered_data[1]
  end

  def current_party
    person_id = params[:person_id]
    data = Parliament::Request.new.people(person_id).parties.current.get
    filtered_data = data.filter('http://id.ukpds.org/schema/Person', 'http://id.ukpds.org/schema/Party')
    @person = filtered_data[0].first
    @party = filtered_data[1].first
  end

  def constituencies
    person_id = params[:person_id]
    data = Parliament::Request.new.people(person_id).constituencies.get
    filtered_data = data.filter('http://id.ukpds.org/schema/Person', 'http://id.ukpds.org/schema/ConstituencyGroup')
    @person = filtered_data[0].first
    @constituencies = filtered_data[1]
  end

  def current_constituency
    person_id = params[:person_id]
    data = Parliament::Request.new.people(person_id).constituencies.current.get
    filtered_data = data.filter('http://id.ukpds.org/schema/Person', 'http://id.ukpds.org/schema/ConstituencyGroup')
    @person = filtered_data[0].first
    @constituency = filtered_data[1].first
  end

  def houses
    person_id = params[:person_id]
    data = Parliament::Request.new.people(person_id).houses.get
    filtered_data = data.filter('http://id.ukpds.org/schema/Person', 'http://id.ukpds.org/schema/House')
    @person = filtered_data[0].first
    @houses = filtered_data[1]
  end

  def current_house
    person_id = params[:person_id]
    data = Parliament::Request.new.people(person_id).houses.current.get
    filtered_data = data.filter('http://id.ukpds.org/schema/Person', 'http://id.ukpds.org/schema/House')
    @person = filtered_data[0].first
    @house = filtered_data[1].first
  end

  def letters
    letter = params[:letter]
    @people = Parliament::Request.new.people(letter).get
  end

  def members_letters
    letter = params[:letter]
    data = Parliament::Request.new.people.members(letter).get
    @people = data.filter('http://id.ukpds.org/schema/Person')
  end

  def current_members_letters
    letter = params[:letter]
    data = Parliament::Request.new.people.members.current(letter).get
    @people = data.filter('http://id.ukpds.org/schema/Person')
  end

  def search_by_letters
    letters = params[:letters]
    data = Parliament::Request.new.people(letters).get

    if data.size == 1
      redirect_to action: 'show', person: data.first.graph_id if data.size == 1
    else
      redirect_to action: 'letters', letter: letters
    end
  end
end
