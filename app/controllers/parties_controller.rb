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
    p @party.method(:members).parameters
    @json_ld = json_ld(result)

    format({ serialized_data: @party, graph_data: result })
  end

  # def members
  #   endpoint_url = "#{API_ENDPOINT}/people/members.ttl"
  #   member_graph = get_graph_data(endpoint_url)
  #   @people = Person.all(member_graph)
  #   @json_ld = json_ld(member_graph)
  #
  #   format({ serialized_data: @people, graph_data: member_graph })
  # end
end
