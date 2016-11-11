class ContactPointsController < ApplicationController

  def index
    endpoint_url = "#{API_ENDPOINT}/contact_points.ttl"
    result = get_graph_data(endpoint_url)
    @contact_points = ContactPoint.all(result)
    @json_ld = json_ld(result)

    format({ serialized_data: @contact_points, graph_data: result })
  end

  def show
    endpoint_url = "#{API_ENDPOINT}/contact_points/#{params[:id]}"
    result = get_graph_data(endpoint_url)
    @contact_point = ContactPoint.find(result)
    @json_ld = json_ld(result)

    format({ serialized_data: @contact_point, graph_data: result })
  end
end
