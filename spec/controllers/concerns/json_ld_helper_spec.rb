require 'rails_helper'

describe JSON_LD_Helper do
  let(:extended_class) { Class.new { extend JSON_LD_Helper } }

  describe '#json_ld' do
    it 'converts a graph into json-ld formatted data' do
      expect(extended_class.json_ld(PEOPLE_GRAPH)).to eq PEOPLE_JSON_LD
    end
  end
end