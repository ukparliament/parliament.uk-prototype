class PartiesController < ApplicationController

  def index
    @parties = Party.all
    # @json_ld = json_ld(result)

    format({ serialized_data: @parties })
  end

  def show
    @party = Party.find(params[:id])
    # @json_ld = json_ld(@party.graph)

    format({ serialized_data: @party })
  end

  def members
    endpoint_url = "#{API_ENDPOINT}/parties/#{params[:party_id]}.ttl"
    result = get_graph_data(endpoint_url)
    party = Party.find(result)
    @members = party.members

    format({ serialized_data: @members })
  end

  def current_members
    endpoint_url = "#{API_ENDPOINT}/parties/#{params[:party_id]}.ttl"
    result = get_graph_data(endpoint_url)
    party = Party.find(result)
    @members = party.members('current')

    format({ serialized_data: @members })
  end
end
