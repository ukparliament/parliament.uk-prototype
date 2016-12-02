class HousesController < ApplicationController

  def index
    @houses = House.all

    format({ serialized_data: @houses })
  end

  def show
    @house = House.find(params[:id])

    format({ serialized_data: @house })
  end

  def members
    @house = House.find(params[:house_id])
    @members = @house.members

    format({ serialized_data: { :house => @house, :members => @members }})
  end

  def current_members
    @house = House.find(params[:house_id])
    @members = @house.members('current')

    format({ serialized_data: { :house => @house, :members => @members }})
  end
end