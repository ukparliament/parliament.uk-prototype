class PartiesController < ApplicationController

  def index
    @parties = Party.all
    graph = collective_graph(@parties)
    @json_ld = json_ld(graph)
    format({ serialized_data: @parties, graph_data: graph })
  end

  def show
    @party = Party.find(params[:id])
    graph = @party.graph
    @json_ld = json_ld(graph)

    format({ serialized_data: @party, graph_data: graph })
  end

  def members
    @party = Party.find(params[:party_id])
    @members = @party.members
    # graph = collective_through_graph(@party, @members, :party_memberships)
    # json_ld(graph)

    format({ serialized_data: @members })
  end

  def current_members
    party = Party.find(params[:party_id])
    @members = party.members('current')

    format({ serialized_data: @members })
  end
end
