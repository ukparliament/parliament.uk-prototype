require 'net/http'
require 'json'

class PeopleController < ApplicationController
  include QueryHelper

  def index
    endpoint_url = "#{MembersPrototype::Application.config.endpoint}/people"
    data = get_data(endpoint_url)
    format(data)
  end

  def show
    endpoint_url = "#{MembersPrototype::Application.config.endpoint}/people/#{params[:id]}.json"
  end
end
