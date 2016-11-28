class PeopleController < ApplicationController

  def index
    @people = Person.all
    graph = collective_graph(@people)
    @json_ld = json_ld(graph)
    format({ serialized_data: @people, graph_data: graph })
  end

  def show
    @person = Person.find(params[:id])
    graph = @person.graph
    @json_ld = json_ld(graph)

    format({ serialized_data: @person, graph_data: graph })
  end

  def members
    @people = Person.all('members')
    graph = collective_graph(@people)
    @json_ld = json_ld(graph)

    format({ serialized_data: @people, graph_data: graph })
  end

  def current_members
    @people = Person.all('members', 'current')
    graph = collective_graph(@people)
    @json_ld = json_ld(graph)

    format({ serialized_data: @people, graph_data: graph })
  end

  def contact_points
    @person = Person.find(params[:person_id])
    @contact_points = @person.contact_points
    graph = collective_has_many_graph(@person, @contact_points)
    @json_ld = json_ld(graph)

    format({ serialized_data: @person.serialize_associated_objects(:contact_points), graph_data: graph })
  end

  def parties
    @person = Person.find(params[:person_id])
    @parties = @person.parties
    graph = collective_through_graph(@person, @parties, :party_memberships)
    @json_ld = json_ld(graph)

    format({ serialized_data: @person.serialize_associated_objects(:parties), graph_data: graph })
  end

  def constituencies
    @person = Person.find(params[:person_id])
    @constituencies = @person.constituencies
    graph = collective_through_graph(@person, @constituencies, :sittings)
    @json_ld = json_ld(graph)

    format({ serialized_data: @person.serialize_associated_objects(:constituencies), graph_data: graph })
  end
end
