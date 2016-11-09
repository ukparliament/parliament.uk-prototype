require 'net/http'
require 'json'

class PeopleController < ApplicationController
  include Grom::GraphMapper

  def index
    endpoint_url = "#{API_ENDPOINT}/people.ttl"
    result = get_graph_data(endpoint_url)
    @people = Person.all(result)
    @json_ld = json_ld(result)

    format({ serialized_data: @people, graph_data: result })
  end

  def show
    endpoint_url = "#{API_ENDPOINT}/people/#{params[:id]}"
    result = get_graph_data(endpoint_url)
    @person = Person.find(result)
    @json_ld = json_ld(result)

    format({ serialized_data: @person, graph_data: result })
  end
end
