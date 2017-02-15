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
    filtered_data = data.filter('http://id.ukpds.org/schema/House', 'http://id.ukpds.org/schema/Person')
    @house = filtered_data[0].first
    @people = filtered_data[1]
  end

  def current_members
    house_id = params[:house_id]
    data = Parliament::Request.new.houses(house_id).members.current.get
    filtered_data = data.filter('http://id.ukpds.org/schema/House', 'http://id.ukpds.org/schema/Person')
    @house = filtered_data[0].first
    @people = filtered_data[1]
  end

  def parties
    house_id = params[:house_id]
    data = Parliament::Request.new.houses(house_id).parties.get
    filtered_data = data.filter('http://id.ukpds.org/schema/House', 'http://id.ukpds.org/schema/Party')
    @house = filtered_data[0].first
    @parties = filtered_data[1]
  end

  def current_parties
    house_id = params[:house_id]
    data = Parliament::Request.new.houses(house_id).parties.current.get
    filtered_data = data.filter('http://id.ukpds.org/schema/House', 'http://id.ukpds.org/schema/Party')
    @house = filtered_data[0].first
    @parties = filtered_data[1]
  end

  def party
    house_id = params[:house_id]
    party_id = params[:party_id]
    data = Parliament::Request.new.houses(house_id).parties(party_id).get
    filtered_data = data.filter('http://id.ukpds.org/schema/House', 'http://id.ukpds.org/schema/Party')
    @house = filtered_data[0].first
    @party = filtered_data[1].first
  end

  def members_letters
    house_id = params[:house_id]
    letter = params[:letter]
    data = Parliament::Request.new.houses(house_id).members(letter).get
    filtered_data = data.filter('http://id.ukpds.org/schema/House', 'http://id.ukpds.org/schema/Person')
    @house = filtered_data[0].first
    @people = filtered_data[1]
  end

  def current_members_letters
    house_id = params[:house_id]
    letter = params[:letter]
    data = Parliament::Request.new.houses(house_id).members.current(letter).get
    filtered_data = data.filter('http://id.ukpds.org/schema/House', 'http://id.ukpds.org/schema/Person')
    @house = filtered_data[0].first
    @people = filtered_data[1]
  end

  def party_members
    house_id = params[:house_id]
    party_id = params[:party_id]
    data = Parliament::Request.new.houses(house_id).parties(party_id).members.get
    filtered_data = data.filter('http://id.ukpds.org/schema/House',
                                'http://id.ukpds.org/schema/Party',
                                'http://id.ukpds.org/schema/Person')
    @house = filtered_data[0].first
    @party = filtered_data[1].first
    @people = filtered_data[2]
  end

  def party_members_letters
    house_id = params[:house_id]
    party_id = params[:party_id]
    letter = params[:letter]
    data = Parliament::Request.new.houses(house_id).parties(party_id).members(letter).get
    filtered_data = data.filter('http://id.ukpds.org/schema/House',
                                'http://id.ukpds.org/schema/Party',
                                'http://id.ukpds.org/schema/Person')
    @house = filtered_data[0].first
    @party = filtered_data[1].first
    @people = filtered_data[2]
  end

  def current_party_members
    house_id = params[:house_id]
    party_id = params[:party_id]
    data = Parliament::Request.new.houses(house_id).parties(party_id).members.current.get
    filtered_data = data.filter('http://id.ukpds.org/schema/House',
                                'http://id.ukpds.org/schema/Party',
                                'http://id.ukpds.org/schema/Person')
    @house = filtered_data[0].first
    @party = filtered_data[1].first
    @people = filtered_data[2]
  end

  def current_party_members_letters
    house_id = params[:house_id]
    party_id = params[:party_id]
    letter = params[:letter]
    data = Parliament::Request.new.houses(house_id).parties(party_id).members.current(letter).get
    filtered_data = data.filter('http://id.ukpds.org/schema/House',
                                'http://id.ukpds.org/schema/Party',
                                'http://id.ukpds.org/schema/Person')
    @house = filtered_data[0].first
    @party = filtered_data[1].first
    @people = filtered_data[2]
  end

  def search_by_letters
    letters = params[:letters]
    data = Parliament::Request.new.houses(letters).get

    if data.size == 1
      redirect_to action: 'show', house: data.first.graph_id if data.size == 1
    else
      redirect_to action: 'index'
    end
  end
end
