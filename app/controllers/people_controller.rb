class PeopleController < ApplicationController

  def index
    @people = Person.all
    collective_graph = Person.extract_collective_graph(@people)
    @json_ld = json_ld(collective_graph)
    format({ serialized_data: @people, graph_data: collective_graph })
  end

  def show
    @person = Person.find(params[:id])
    graph = @person.extract_graph
    @json_ld = json_ld(graph)

    format({ serialized_data: @person, graph_data: graph })
  end

  def members
    @people = Person.all('members')
    collective_graph = Person.extract_collective_graph(@people)
    @json_ld = json_ld(collective_graph)

    format({ serialized_data: @people, graph_data: collective_graph })
  end

  def current_members
    @people = Person.all('members', 'current')
    collective_graph = Person.extract_collective_graph(@people)
    @json_ld = json_ld(collective_graph)

    format({ serialized_data: @people, graph_data: collective_graph })
  end

  def contact_points
    person = Person.find(params[:person_id])
    @contact_points = person.contact_points
    graph = ContactPoint.extract_collective_graph(@contact_points)

    format({ serialized_data: @contact_points, graph_data: graph })
  end

  def parties
    endpoint_url = "#{API_ENDPOINT}/people/#{params[:person_id]}.ttl"
    result = get_graph_data(endpoint_url)
    person = Person.find(result)
    @parties = person.parties

    format({ serialized_data: @parties })
  end

  def constituencies
    endpoint_url = "#{API_ENDPOINT}/people/#{params[:person_id]}.ttl"
    result = get_graph_data(endpoint_url)
    person = Person.find(result)
    @constituencies = person.constituencies

    format({ serialized_data: @constituencies })
  end
end
