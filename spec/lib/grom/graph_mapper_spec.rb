require 'rails_helper'

describe Grom::GraphMapper do
  let(:extended_class) { Class.new { extend Grom::GraphMapper } }

  describe '#create_graph_from_ttl' do
    it 'should create an RDF graph given ttl data in a string format' do
      expect(extended_class.create_graph_from_ttl(PERSON_ONE_TTL).first).to eq PERSON_ONE_GRAPH.first
    end
  end

  describe '#get_id' do
    it 'should return the id given a uri' do
      expect(extended_class.get_id(RDF::URI.new('http://id.ukpds.org/123'))).to eq '123'
    end
  end

  describe '#statements_mapper_by_subject' do
    it 'should return a hash with the mapped predicates and the respective objects from a graph' do
      expect(extended_class.statements_mapper_by_subject(PEOPLE_GRAPH)).to include(PEOPLE_HASH[0])
      expect(extended_class.statements_mapper_by_subject(PEOPLE_GRAPH)).to include(PEOPLE_HASH[1])
    end
  end

  describe '#get_object_and_predicate' do
    it 'should should return a hash with predicate and object, given an RDF statement' do
      expect(extended_class.get_object_and_predicate(ONE_STATEMENT_STUB)).to eq({ :forename => 'Daenerys' })
    end
  end

  describe '#get_through_graphs' do
    it 'should return an array of graphs, given a graph and an id' do
      result_arr = extended_class.get_through_graphs(PARTY_MEMBERSHIP_GRAPH, '23')
      start_date_statement = RDF::Statement.new(RDF::URI.new('http://id.ukpds.org/25'), RDF::URI.new('http://id.ukpds.org/schema/partyMembershipStartDate'), RDF::Literal.new("1953-01-12", :datatype => RDF::XSD.date))
      end_date_statement = RDF::Statement.new(RDF::URI.new('http://id.ukpds.org/25'), RDF::URI.new('http://id.ukpds.org/schema/partyMembershipEndDate'), RDF::Literal.new("1954-01-12", :datatype => RDF::XSD.date))
      expect(result_arr[0].has_statement?(start_date_statement)).to be true
      expect(result_arr[0].has_statement?(end_date_statement)).to be true
    end
  end
end