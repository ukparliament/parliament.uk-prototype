class PeopleController < ApplicationController

  def index
    @people = Person.all
    # @collective_graph = @people.extract_collective_graph
    @collective_graph = RDF::Graph.new
    @people.each do |person|
      @collective_graph << person.graph
      person.send(:remove_instance_variable, :@graph)
    end
    @json_ld = json_ld(@collective_graph)
    format({ serialized_data: @people, graph_data: @collective_graph })
  end

  def show
    @person = Person.find(params[:id])
    # @graph = @person.extract_graph
    @graph = @person.graph
    @person.send(:remove_instance_variable, :@graph)
    @json_ld = json_ld(@graph)

    format({ serialized_data: @person, graph_data: @graph })
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

  def constituencies
    endpoint_url = "#{API_ENDPOINT}/people/#{params[:person_id]}.ttl"
    result = get_graph_data(endpoint_url)
    person = Person.find(result)
    @constituencies = person.constituencies

    format({ serialized_data: @constituencies })
  end
end
