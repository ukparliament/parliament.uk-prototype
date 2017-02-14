class PartiesController < ApplicationController
  def index
    @parties = Parliament::Request.new.parties.get
  end

  def current
    @parties = Parliament::Request.new.parties.current.get
  end

  def show
    id = params[:id]
    data = Parliament::Request.new.parties(id).get

    @party = data.first
  end

  def members
    party_id = params[:party_id]
    data = Parliament::Request.new.parties(party_id).members.get

    @people = data.filter('http://id.ukpds.org/schema/Person')
  end

  def current_members
    party_id = params[:party_id]
    data = Parliament::Request.new.parties(party_id).members.current.get

    @people = data.filter('http://id.ukpds.org/schema/Person')
  end

  def letters
    letter = params[:letter]
    data = Parliament::Request.new.parties(letter).get

    @party = data.first
  end

  def members_letters
    letter = params[:letter]
    party_id = params[:party_id]
    data_party = Parliament::Request.new.parties(party_id).get
    data_members = Parliament::Request.new.parties(party_id).members(letter).get

    @party = data_party.first
    @people = data_members.filter('http://id.ukpds.org/schema/Person')
  end

  def current_members_letters
    letter = params[:letter]
    party_id = params[:party_id]
    data_party = Parliament::Request.new.parties(party_id).get
    data_current_members = Parliament::Request.new.parties(party_id).members.current(letter).get

    @party = data_party.first
    @people = data_current_members.filter('http://id.ukpds.org/schema/Person')
  end
end
