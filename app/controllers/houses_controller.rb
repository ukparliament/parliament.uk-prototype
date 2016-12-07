class HousesController < ApplicationController

  def index
    @houses = order_list(House.all, :id)

    format({ serialized_data: @houses })
  end

  def show
    @house = House.find(params[:id]) or not_found

    format({ serialized_data: @house })
  end

  def members
    @house = House.find(params[:house_id]) or not_found
    @members = order_list(@house.members, :surname, :forename)

    format({ serialized_data: { house: @house, members: @members }})
  end

  def current_members
    @house = House.find(params[:house_id]) or not_found
    @members = order_list(@house.members('current'), :surname, :forename)

    format({ serialized_data: { house: @house, members: @members }})

    render "members"
  end

  def parties
    @house = House.find(params[:house_id]) or not_found
    @parties = order_list(@house.parties, :name)

    format({ serialized_data: { house: @house, parties: @parties } })
  end

  def current_parties
    @house = House.find(params[:house_id]) or not_found
    @parties = order_list(@house.parties('current'), :name)

    format({ serialized_data: { house: @house, parties: @parties } })
  end

  def members_letters
    letter = params[:letter]
    @house = House.find(params[:house_id])
    @members = order_list(@house.members(letter), :surname, :forename)

    format({ serialized_data: { house: @house, members: @members } })

    render "members"
  end

  def current_members_letters
    letter = params[:letter]
    @house = House.find(params[:house_id])
    @members = order_list(@house.members('current', letter), :surname, :forename)

    format({ serialized_data: { house: @house, members: @members } })

    render "members"
  end
end