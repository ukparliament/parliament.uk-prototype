class PeopleController < ApplicationController

  def index
    binding.pry
    @people = Parliament::Request.new.people.get
  end

  def show
    person_id = params[:id]
    data = Parliament::Request.new.people(person_id).get
    @person = data.filter('http://id.ukpds.org/Person').first
    @parties = data.filter('http://id.ukpds.org/Party')
    @constituencies = data.filter('http://id.ukpds.org/ConstituencyGroup')
    @contact_points = data.filter('http://id.ukpds.org/ContactPoint')
    @houses = data.filter('http://id.ukpds.org/House')
  end

  def members

  end

  def current_members

  end

  def contact_points

  end

  def parties

  end

  def current_party

  end

  def constituencies

  end

  def current_constituency

  end

  def houses

  end

  def current_house

  end

  def letters

  end

  def members_letters

  end

  def current_members_letters

  end
end
