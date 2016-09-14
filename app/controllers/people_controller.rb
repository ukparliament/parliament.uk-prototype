class PeopleController < ApplicationController
  def index
    endpoint_url = "#{MembersPrototype::Application.config.endpoint}.json"
  end

  def show
    endpoint_url = "#{MembersPrototype::Application.config.endpoint}/people/#{params[:id]}.json"
  end
end
