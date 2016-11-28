class ContactPointsController < ApplicationController

  def index
    @contact_points = ContactPoint.all
    graph = ContactPoint.collective_graph(@contact_points)
    @json_ld = json_ld(graph)

    format({ serialized_data: @contact_points, graph_data: graph })
  end

  def show
    @contact_point = ContactPoint.find(params[:id])
    graph = @contact_point.graph
    @json_ld = json_ld(graph)

    format({ serialized_data: @contact_point, graph_data: graph })
  end
end
