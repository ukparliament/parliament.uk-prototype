require 'rails_helper'

describe Party do
  let(:party) { Party.new({ id: '123', partyName: 'Targaryens' }) }

  describe 'properties' do
    it 'can have an id' do
      expect(party.id).to eq '123'
    end

    it 'can have an name' do
      expect(party.name).to eq 'Targaryens'
    end
  end
end
