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

    def split_subject(graph, class_one)
      pattern_one = RDF::Query::Pattern.new(:subject, RDF::URI.new("http://www.w3.org/1999/02/22-rdf-syntax-ns#type"), RDF::URI.new("http://id.ukpds.org/schema/#{class_one}"))
      graph_one = RDF::Graph.new
      graph.query(pattern_one).subjects.each do |subject|
        graph.delete(RDF::Statement.new(subject, RDF::URI.new("http://www.w3.org/1999/02/22-rdf-syntax-ns#type"), RDF::URI.new("http://id.ukpds.org/schema/#{class_one}")))
      pattern = RDF::Query::Pattern.new(subject, :predicate, :object)
        graph.query(pattern).each do |statement|
          graph.delete(statement)
          graph_one << statement
        end
      end
      { graph: graph, graph_one: graph_one }
    end

    def get_associated_graphs(graph, id)
      pattern = RDF::Query::Pattern.new(:subject, :predicate, RDF::URI.new("http://id.ukpds.org/#{id}"))
      graph.query(pattern).subjects.map do |subject|
        new_pattern = RDF::Query::Pattern.new(subject, :predicate, :object)
        graph.query(new_pattern).map do |statement|
          RDF::Graph.new << statement
        end
      end
    end

    def to_underscore_case(string)
      string.split('').map { |c| c == c.upcase ? '_' + c.downcase : c }.join('')
    end

  end
end