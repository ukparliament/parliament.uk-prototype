require 'net/http'
require 'json'
require 'graph_mapper'

class PeopleController < ApplicationController
  include GraphMapper

  def index
    endpoint_url = "#{API_ENDPOINT}/people"
    result = get_graph_data(endpoint_url)
    @people = Person.all(result)
    if request.format.to_sym.to_s == 'html'
      @json_ld = json_ld(result)
    end
    format({ serialized_data: @people, graph_data: result})
  end

  def show
    endpoint_url = "#{MembersPrototype::Application.config.endpoint}/people/#{params[:id]}"
    data = get_data(endpoint_url)
    if request.format.to_sym.to_s == 'html'
      @person = serialize_people(data[:json])[0]
      @json_ld = json_ld(data[:graph])
    end

    format(data)
  end

  private

  def serialize_people(data)
    data = JSON.parse(data)
    data.map do |person_data|
      hash_data = person_data
      Person.new(hash_data)
    end
  end
end
