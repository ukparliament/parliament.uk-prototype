require 'rails_helper'

describe GraphMapper do
  let(:extended_class) { Class.new { extend GraphMapper } }

  describe '#create_graph_from_ttl' do
    it 'should create an RDF graph given ttl data in a string format' do
      expect(extended_class.create_graph_from_ttl(PERSON_ONE_TTL).first).to eq PEOPLE_STATEMENTS[0]
    end
  end

  describe '#to_underscore_case' do
    it 'should transform dateOfBirth to date_of_birth' do
      expect(extended_class.to_underscore_case('dateOfBirth')).to eq 'date_of_birth'
    end
  end
end