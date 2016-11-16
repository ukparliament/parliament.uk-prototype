require 'grom'
require 'net/http'

module Grom
  module GraphMapper

    def get_graph_data(uri)
      ttl_data = Net::HTTP.get(URI(uri))
      create_graph_from_ttl(ttl_data)
    end

    def create_graph_from_ttl(ttl_data)
      graph = RDF::Graph.new
      RDF::NTriples::Reader.new(ttl_data) do |reader|
        reader.each_statement do |statement|
          graph << statement
        end
      end
      graph
    end

    def get_id(uri)
      uri.to_s.split("/").last
    end

    def get_object_and_predicate(statement)
      predicate = get_id(statement.predicate)
      { predicate.to_sym => statement.object.to_s }
    end

    def statements_mapper_by_subject(graph)
      graph.subjects.map do |subject|
        pattern = RDF::Query::Pattern.new(subject, :predicate, :object)
        attributes = graph.query(pattern).map do |statement|
          get_object_and_predicate(statement)
        end.reduce({}, :merge)
        attributes.merge({id: get_id(subject)})
      end
    end

    def split_by_subject(graph, associated_class_name)
      associated_class_type_pattern = RDF::Query::Pattern.new(:subject, RDF.type, RDF::URI.new("#{DATA_URI_PREFIX}/schema/#{associated_class_name}"))
      associated_graph = RDF::Graph.new
      graph.query(associated_class_type_pattern).subjects.map do |subject|
        graph.delete(graph.query(associated_class_type_pattern))
        subject_pattern = RDF::Query::Pattern.new(subject, :predicate, :object)
        graph.query(subject_pattern).each do |statement|
          associated_graph << statement
        end
        graph.delete(graph.query(subject_pattern))
      end
      { through_graph: graph, associated_class_graph: associated_graph }
    end

    def get_through_graphs(graph, id)
      connection_pattern = RDF::Query::Pattern.new(:subject, :predicate, RDF::URI.new("#{DATA_URI_PREFIX}/#{id}"))
      graph.query(connection_pattern).subjects.map do |subject|
        type_pattern = RDF::Query::Pattern.new(subject, RDF.type, :object)
        graph.delete(graph.query(connection_pattern))
        graph.delete(graph.query(type_pattern))
        subject_pattern = RDF::Query::Pattern.new(subject, :predicate, :object)
        graph.query(subject_pattern)
      end
    end

  end
end