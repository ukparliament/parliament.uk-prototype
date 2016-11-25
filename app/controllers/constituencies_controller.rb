class ConstituenciesController < ApplicationController

  def index
    @constituencies = Constituency.all
    graph = Constituency.collective_graph(@constituencies)
    @json_ld = json_ld(graph)

    format({ serialized_data: @constituencies})
  end

  def show
    @constituency = Constituency.find(params[:id])
    graph = @constituency.graph
    @json_ld = json_ld(graph)

    format({ serialized_data: @constituency.serialize_associated_objects(:members), graph_data: graph })
  end

  def map
    @constituency = Constituency.find(params[:constituency_id])
    graph = @constituency.graph
    @json_ld = json_ld(graph)

    format({ serialized_data: @constituency, graph_data: graph })
  end

  def members
    @constituency = Constituency.find(params[:constituency_id])
    graph = collective_through_graph(@constituency, @constituency.members, :sittings)
    @json_ld = json_ld(graph)

    format({ serialized_data: @constituency.serialize_associated_objects(:members), graph_data: graph })
  end

  def current_members
    @constituency = Constituency.find(params[:constituency_id])
    graph = collective_through_graph(@constituency, @constituency.members('current'), :sittings)
    @json_ld = json_ld(graph)

    format({ serialized_data: @constituency.serialize_associated_objects({members: 'current'}), graph_data: graph })
  end

end