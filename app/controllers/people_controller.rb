require 'net/http'
require 'json'

class PeopleController < ApplicationController

  def index
    endpoint_url = "#{MembersPrototype::Application.config.endpoint}/people.json"
    response = Net::HTTP.get(URI(endpoint_url))
    data = JSON.parse(response)
    @people = data.map do |person_hash|
      Person.new(person_hash)
    end

  end

  def show
    endpoint_url = "#{MembersPrototype::Application.config.endpoint}/people/#{params[:id]}.json"
  end
end
