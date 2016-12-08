require 'rails_helper'

describe Constituency do
  let(:constituency) { Constituency.new({ id: '123',
                                          constituencyName: 'Peterborough',
                                          constituencyStartDate: '1998-01-02',
                                          constituencyEndDate: '2001-01-02',
                                          constituencyOnsCode: 'E14000878',
                                          constituencyLatitude: '52.617455924',
                                          constituencyLongitude: '-0.160666854394',
                                          constituencyExtent: 'Polygon((0, 1, 3, 4))',
                                          graph: RDF::Graph.new }) }

  describe 'properties' do
    it 'can have an id' do
      expect(constituency.id).to eq '123'
    end

    it 'can have an name' do
      expect(constituency.name).to eq 'Peterborough'
    end

    it 'can have a start date' do
      expect(constituency.start_date).to eq '1998-01-02'
    end

    it 'can have an end date' do
      expect(constituency.end_date).to eq '2001-01-02'
    end

    it 'can have a latitude' do
      expect(constituency.latitude).to eq '52.617455924'
    end

    it 'can have a longitude' do
      expect(constituency.longitude).to eq '-0.160666854394'
    end

    it 'can have a polygon' do
      expect(constituency.polygon).to eq 'Polygon((0, 1, 3, 4))'
    end

    it 'can have an ONS code' do
      expect(constituency.ons_code).to eq 'E14000878'
    end

    it 'can have a graph' do
      expect(constituency).to respond_to(:graph)
    end
  end
end
