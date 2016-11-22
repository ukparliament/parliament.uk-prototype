class ConstituenciesController < ApplicationController

  def index
    endpoint_url = "#{API_ENDPOINT}/constituencies.ttl"
    result = get_graph_data(endpoint_url)
    @constituencies = Constituency.all(result)
    @json_ld = json_ld(result)

    format({ serialized_data: @constituencies, graph_data: result })
  end

  def show
    endpoint_url = "#{API_ENDPOINT}/constituencies/#{params[:id]}.ttl"
    result = get_graph_data(endpoint_url)
    @constituency = Constituency.find(result)
    @json_ld = json_ld(result)

    format({ serialized_data: @constituency, graph_data: result })
  end

  def map
    endpoint_url = "#{API_ENDPOINT}/constituencies/#{params[:id]}.ttl"
    result = get_graph_data(endpoint_url)
    @constituency = Constituency.find(result)

    format({ serialized_data: @constituency, graph_data: result })
  end

  def members
    endpoint_url = "#{API_ENDPOINT}/constituencies/#{params[:constituency_id]}.ttl"
    result = get_graph_data(endpoint_url)
    constituency = Constituency.find(result)
    @members = constituency.members

    format({ serialized_data: @members })
  end

  def current_members
    endpoint_url = "#{API_ENDPOINT}/constituencies/#{params[:constituency_id]}.ttl"
    result = get_graph_data(endpoint_url)
    constituency = Constituency.find(result)
    @current_members = constituency.members('current')

    format({ serialized_data: @current_members })
  end

end