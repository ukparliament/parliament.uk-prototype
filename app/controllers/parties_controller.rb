class PartiesController < ApplicationController

  def index
    endpoint_url = "#{API_ENDPOINT}/parties.ttl"
    result = get_graph_data(endpoint_url)
    @parties = Party.all(result)
    @json_ld = json_ld(result)

    format({ serialized_data: @parties, graph_data: result })
  end

  def show
    endpoint_url = "#{API_ENDPOINT}/parties/#{params[:id]}.ttl"
    result = get_graph_data(endpoint_url)
    @party = Party.find(result)
    @json_ld = json_ld(result)

    format({ serialized_data: @party, graph_data: result })
  end

  def members
    endpoint_url = "#{API_ENDPOINT}/parties/#{params[:person_id]}/members.ttl"
    result = get_graph_data(endpoint_url)
    party = Party.find(result)
    @members = party.members

    format({ serialized_data: @members })
  end
end
