require 'rails_helper'

describe Party do
  let(:party) { Party.new({ id: '123', partyName: 'Targaryens', graph: RDF::Graph.new }) }

  describe 'properties' do
    it 'can have an id' do
      expect(party.id).to eq '123'
    end

    it 'can have an name' do
      expect(party.name).to eq 'Targaryens'
    end

    it 'can have a graph' do
      expect(party).to respond_to(:graph)
    end
  end
end