class HousesController < ApplicationController

  def index
    @houses = order_list(House.all, :id)

    format({ serialized_data: @houses })
  end

  def show
    @house = House.find(params[:id])

    format({ serialized_data: @house })
  end

  def members
    @house = House.find(params[:house_id])
    @members = order_list(@house.members, :surname, :forename)

    format({ serialized_data: { house: @house, members: @members }})
  end

  def current_members
    @house = House.find(params[:house_id])
    @members = order_list(@house.members('current'), :surname, :forename)

    format({ serialized_data: { house: @house, members: @members }})
  end

  def parties
    @house = House.find(params[:house_id])
    @parties = order_list(@house.parties, :name)

    format({ serialized_data: { house: @house, parties: @parties } })
  end

  def current_parties
    @house = House.find(params[:house_id])
    @parties = order_list(@house.parties('current'), :name)

    format({ serialized_data: { house: @house, parties: @parties } })
  end
end