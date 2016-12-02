class HousesController < ApplicationController

  def index
    @houses = House.all

    format({ serialized_data: @houses })
  end

  def show
    @house = House.find(params[:id])

    format({ serialized_data: @house })
  end
end