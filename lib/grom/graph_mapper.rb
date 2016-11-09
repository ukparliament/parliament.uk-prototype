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

    def to_underscore_case(string)
      string.split('').map { |c| c == c.upcase ? '_' + c.downcase : c }.join('')
    end

  end
end