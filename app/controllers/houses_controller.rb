class HousesController < ApplicationController
  def index
    @houses = Parliament::Request.new.houses.get
  end

  def show
    house_id = params[:house_id]
    data = Parliament::Request.new.houses(house_id).get
    @house = data.filter('http://id.ukpds.org/schema/House').first
  end

  def members
    house_id = params[:house_id]
    data = Parliament::Request.new.houses(house_id).members.get
    @house = data.filter('http://id.ukpds.org/schema/House').first
    @people = data.filter('http://id.ukpds.org/schema/Person')
  end

  def current_members
    house_id = params[:house_id]
    data = Parliament::Request.new.houses(house_id).members.current.get
    @house = data.filter('http://id.ukpds.org/schema/House').first
    @people = data.filter('http://id.ukpds.org/schema/Person')
  end

  def parties
    house_id = params[:house_id]
    data = Parliament::Request.new.houses(house_id).parties.get
    @house = data.filter('http://id.ukpds.org/schema/House').first
    @parties = data.filter('http://id.ukpds.org/schema/Party')
  end

  def current_parties
    house_id = params[:house_id]
    data = Parliament::Request.new.houses(house_id).parties.current.get
    @house = data.filter('http://id.ukpds.org/schema/House').first
    @parties = data.filter('http://id.ukpds.org/schema/Party')

    render 'parties'
  end

  def party
    house_id = params[:house_id]
    party_id = params[:party_id]
    data = Parliament::Request.new.houses(house_id).parties(party_id).get
    @house = data.filter('http://id.ukpds.org/schema/House').first
    @party = data.filter('http://id.ukpds.org/schema/Party').first
  end

  def members_letters
    house_id = params[:house_id]
    letter = params[:letter]
    data = Parliament::Request.new.houses(house_id).members(letter).get
    @house = data.filter('http://id.ukpds.org/schema/House').first
    @people = data.filter('http://id.ukpds.org/schema/Person')

    render 'members'
  end

  def current_members_letters
    house_id = params[:house_id]
    letter = params[:letter]
    data = Parliament::Request.new.houses(house_id).members.current(letter).get
    @house = data.filter('http://id.ukpds.org/schema/House').first
    @people = data.filter('http://id.ukpds.org/schema/Person')

    render 'current_members'
  end

  def party_members
    house_id = params[:house_id]
    party_id = params[:party_id]
    data = Parliament::Request.new.houses(house_id).parties(party_id).members.get
    @house = data.filter('http://id.ukpds.org/schema/House').first
    @party = data.filter('http://id.ukpds.org/schema/Party').first
    @people = data.filter('http://id.ukpds.org/schema/Person')
  end

  def party_members_letters
    house_id = params[:house_id]
    party_id = params[:party_id]
    letter = params[:letter]
    data = Parliament::Request.new.houses(house_id).parties(party_id).members(letter).get
    @house = data.filter('http://id.ukpds.org/schema/House').first
    @party = data.filter('http://id.ukpds.org/schema/Party').first
    @people = data.filter('http://id.ukpds.org/schema/Person')

    render 'party_members'
  end

  def current_party_members
    house_id = params[:house_id]
    party_id = params[:party_id]
    data = Parliament::Request.new.houses(house_id).parties(party_id).members.current.get
    @house = data.filter('http://id.ukpds.org/schema/House').first
    @party = data.filter('http://id.ukpds.org/schema/Party').first
    @people = data.filter('http://id.ukpds.org/schema/Person')

    render 'party_members'
  end

  def current_party_members_letters
    house_id = params[:house_id]
    party_id = params[:party_id]
    letter = params[:letter]
    data = Parliament::Request.new.houses(house_id).parties(party_id).members.current(letter).get
    @house = data.filter('http://id.ukpds.org/schema/House').first
    @party = data.filter('http://id.ukpds.org/schema/Party').first
    @people = data.filter('http://id.ukpds.org/schema/Person')

    render 'party_members'
  end
end
