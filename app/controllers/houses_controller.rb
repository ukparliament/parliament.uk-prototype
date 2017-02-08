class HousesController < ApplicationController
  def index
    @houses = Parliament::Request.new.houses.get
  end

  def show
    house_id = params[:id]
    data = Parliament::Request.new.houses(house_id).get
    @house = data.filter('http://id.ukpds.org/schema/House').first.first
  end

  def members
    house_id = params[:house_id]
    data = Parliament::Request.new.houses(house_id).members.get
    @house = data.filter('http://id.ukpds.org/schema/House').first.first
    @people = data.filter('http://id.ukpds.org/schema/Person').first
  end

  def current_members
    house_id = params[:house_id]
    data = Parliament::Request.new.houses(house_id).members.current.get
    @house = data.filter('http://id.ukpds.org/schema/House').first.first
    @people = data.filter('http://id.ukpds.org/schema/Person').first
  end

  def parties
    house_id = params[:house_id]
    data = Parliament::Request.new.houses(house_id).parties.get
    @house = data.filter('http://id.ukpds.org/schema/House').first.first
    @parties = data.filter('http://id.ukpds.org/schema/Party').first
  end

  def current_parties
    house_id = params[:house_id]
    data = Parliament::Request.new.houses(house_id).parties.current.get
    @house = data.filter('http://id.ukpds.org/schema/House').first.first
    @parties = data.filter('http://id.ukpds.org/schema/Party').first

    render 'parties'
  end

  def members_letters
    house_id = params[:house_id]
    letter = params[:letter]
    data = Parliament::Request.new.houses(house_id).members(letter).get
    @house = data.filter('http://id.ukpds.org/schema/House').first.first
    @people = data.filter('http://id.ukpds.org/schema/Person').first

    render 'members'
  end

  def current_members_letters
    house_id = params[:house_id]
    letter = params[:letter]
    data = Parliament::Request.new.houses(house_id).members.current(letter).get
    @house = data.filter('http://id.ukpds.org/schema/House').first.first
    @people = data.filter('http://id.ukpds.org/schema/Person').first

    render 'current_members'
  end
end
