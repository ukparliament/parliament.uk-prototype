require 'net/http'
require 'json'

class PeopleController < ApplicationController
  include QueryHelper

  def index
    endpoint_url = "#{MembersPrototype::Application.config.endpoint}/people"
    data = get_data(endpoint_url)
    @people = serialize_people(data)
    format(data)
  end

  def show
    endpoint_url = "#{MembersPrototype::Application.config.endpoint}/people/#{params[:id]}"
    data = get_data(endpoint_url)
    @person = serialize_people(data)[0] if(request.format.to_sym.to_s == 'html')
    format(data)
  end

  private

  def serialize_people(data)
    data = JSON.parse(data)
    data["people"].map do |person_data|
      hash_data = person_data
      Person.new(hash_data)
    end
  end
end
