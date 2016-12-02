class ContactPointsController < ApplicationController

  def index
    @contact_points = ContactPoint.all

    format({ serialized_data: @contact_points })
  end

  def show
    @contact_point = ContactPoint.find(params[:id])

    format({ serialized_data: @contact_point })
  end
end
