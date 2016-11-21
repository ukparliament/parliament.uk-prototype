class PeopleController < ApplicationController

  def index
    endpoint_url = "#{API_ENDPOINT}/people.ttl"
    result = get_graph_data(endpoint_url)
    @people = Person.all(result)
    @json_ld = json_ld(result)

    format({ serialized_data: @people, graph_data: result })
  end

  def show
    endpoint_url = "#{API_ENDPOINT}/people/#{params[:id]}.ttl"
    result = get_graph_data(endpoint_url)
    @person = Person.find(result)
    @json_ld = json_ld(result)

    format({ serialized_data: @person, graph_data: result })
  end

  def members
    endpoint_url = "#{API_ENDPOINT}/people/members.ttl"
    member_graph = get_graph_data(endpoint_url)
    @people = Person.all(member_graph)
    @json_ld = json_ld(member_graph)

    format({ serialized_data: @people, graph_data: member_graph })
  end

  def current_members
    endpoint_url = "#{API_ENDPOINT}/people/members/current.ttl"
    current_member_graph = get_graph_data(endpoint_url)
    @people = Person.all(current_member_graph)
    @json_ld = json_ld(current_member_graph)

    format({ serialized_data: @people, graph_data: current_member_graph })
  end

  def contact_points
    endpoint_url = "#{API_ENDPOINT}/people/#{params[:person_id]}.ttl"
    result = get_graph_data(endpoint_url)
    person = Person.find(result)
    @contact_points = person.contact_points

    format({ serialized_data: @contact_points })
  end

  def parties
    endpoint_url = "#{API_ENDPOINT}/people/#{params[:person_id]}.ttl"
    result = get_graph_data(endpoint_url)
    person = Person.find(result)
    @parties = person.parties

    format({ serialized_data: @parties })
  end
end
