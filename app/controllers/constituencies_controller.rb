class ConstituenciesController < ApplicationController

  def index
    @constituencies = order_list(Constituency.all, :name)

    format({ serialized_data: @constituencies })
  end

  def show
    @constituency = Constituency.find(params[:id])
    @members = @constituency.members
    @sittings = order_list_by_through(@members, :sittings, :sittingStartDate)

    format({ serialized_data: { :constituency => @constituency, :members => @members } } )
  end

  def current
    @constituencies = order_list(Constituency.all('current'), :name)

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
    @sittings = order_list_by_through(@members, :sittings, :sittingStartDate)

    format({ serialized_data: { :constituency => @constituency, :members => @members } })
  end

  def current_members
    @constituency = Constituency.find(params[:constituency_id])
    @members = @constituency.members('current')

    format({ serialized_data: { :constituency => @constituency, :members => @members } })
  end

end