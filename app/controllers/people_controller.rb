require 'net/http'
require 'json'

class PeopleController < ApplicationController

  def index
    endpoint_url = "#{MembersPrototype::Application.config.endpoint}/people.json"
    response = Net::HTTP.get(URI(endpoint_url))
    data = JSON.parse(response)
    @people = serialize_people(data)
  end

  def show
    endpoint_url = "#{MembersPrototype::Application.config.endpoint}/people/#{params[:id]}.json"
    response = Net::HTTP.get(URI(endpoint_url))
    data = JSON.parse(response)
    @person = serialize_people(data)[0]
  end

  private

  def serialize_people(data)
    data["people"].map do |person_data|
      hash_data = person_data
      Person.new(hash_data)
    end
  end
end
