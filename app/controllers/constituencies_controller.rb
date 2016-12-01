class ConstituenciesController < ApplicationController

  def index
    @constituencies = Constituency.all

    format({ serialized_data: @constituencies })
  end

  def show
    @constituency = Constituency.find(params[:id])

    format({ serialized_data: @constituency.serialize_associated_objects(:members) })
  end

  def current
    @constituencies = Constituency.all('current')

    format({ serialized_data: @constituencies })
  end

  def map
    @constituency = Constituency.find(params[:constituency_id])

    format({ serialized_data: @constituency })
  end

  def contact_point
    @constituency = Constituency.find(params[:constituency_id])

    format({ serialized_data: @constituency.serialize_associated_objects(:contact_point)})
  end

  def members
    @constituency = Constituency.find(params[:constituency_id])

    format({ serialized_data: @constituency.serialize_associated_objects(:members) })
  end

  def current_members
    @constituency = Constituency.find(params[:constituency_id])

    format({ serialized_data: @constituency.serialize_associated_objects({members: 'current'}) })
  end

end