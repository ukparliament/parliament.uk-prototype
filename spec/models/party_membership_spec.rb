require 'rails_helper'

describe PartyMembership do
  let(:sitting) { PartyMembership.new({ id: '123', partyMembershipStartDate: '1998-01-02', partyMembershipEndDate: '2001-01-02', graph: RDF::Graph.new }) }

  describe 'properties' do
    it 'can have an id' do
      expect(sitting.id).to eq '123'
    end

    it 'can have an start date' do
      expect(sitting.start_date).to eq '1998-01-02'
    end

    it 'can have an end date' do
      expect(sitting.end_date).to eq '2001-01-02'
    end

    it 'can have a graph' do
      expect(sitting).to respond_to(:graph)
    end
  end
end