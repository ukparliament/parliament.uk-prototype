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

  describe '#split_by_subject' do
    let(:result) { extended_class.split_by_subject(PARTY_AND_PARTY_MEMBERSHIP_ONE_GRAPH, 'DummyParty') }
    let(:type_pattern) { RDF::Query::Pattern.new(:subject, RDF.type, :object) }

    it 'should return a hash with the property "associated_class_graph" for the associated property' do
      expect(result[:associated_class_graph].first.object.to_s).to eq 'Targaryens'
    end

    it 'should delete the type statement from the "associated_class_graph"' do
      expect(result[:associated_class_graph].query(type_pattern).first).to eq nil
    end

    it 'should return a hash with the property "through_graph" for the through property' do
      start_date_pattern = RDF::Query::Pattern.new(:subject, RDF::URI.new("#{DATA_URI_PREFIX}/schema/partyMembershipStartDate"), :object)
      end_date_pattern = RDF::Query::Pattern.new(:subject, RDF::URI.new("#{DATA_URI_PREFIX}/schema/partyMembershipEndDate"), :object)
      expect(result[:through_graph].query(start_date_pattern).first.object.to_s).to eq '1953-01-12'
      expect(result[:through_graph].query(end_date_pattern).first.object.to_s).to eq '1954-01-12'
    end

    it 'should keep the type statement from the "through_graph"' do
      expect(result[:through_graph].query(type_pattern).first.object.to_s).to eq "#{DATA_URI_PREFIX}/schema/DummyPartyMembership"
    end

    it 'should return the associated object id in the "through_graph"' do
      associated_class_pattern = RDF::Query::Pattern.new(:subject, RDF::URI.new("#{DATA_URI_PREFIX}/schema/partyMembershipHasParty"), :object)
      expect(result[:through_graph].query(associated_class_pattern).first.object.to_s).to eq "#{DATA_URI_PREFIX}/23"
    end
  end
end