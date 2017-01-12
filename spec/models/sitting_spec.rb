require 'rails_helper'

describe Sitting do
  let(:sitting) { Sitting.new({ id: '123', sittingStartDate: '1998-01-02', sittingEndDate: '2001-01-02' }) }

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
  end
end
