class ConstituenciesController < ApplicationController

  def index
    @constituencies = Constituency.all

    format({ serialized_data: @constituencies })
  end

  def show
    @constituency = Constituency.find(params[:id])
    @members = @constituency.members

    format({ serialized_data: { :constituency => @constituency, :members => @members } } )
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
    @contact_point = @constituency.contact_point

    format({ serialized_data: { :constituency => @constituency, :contact_point => @contact_point } })
  end

  def members
    @constituency = Constituency.find(params[:constituency_id])
    @members = @constituency.members

    format({ serialized_data: { :constituency => @constituency, :members => @members } })
  end

  def current_members
    @constituency = Constituency.find(params[:constituency_id])
    @members = @constituency.members('current')

    format({ serialized_data: { :constituency => @constituency, :members => @members } })
  end

end