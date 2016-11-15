require 'rails_helper'

describe Grom::Helpers do

  let(:extended_class) { Class.new { extend Grom::Helpers } }

  describe '#url_builder' do
    it 'should return an endpoint when given a class and an associated class' do
      dummy = Dummy.find(PERSON_ONE_GRAPH)
      url = extended_class.url_builder(dummy, "Party")
      expect(url).to eq "#{API_ENDPOINT}/dummies/1/parties.ttl"
    end

    it 'should return an endpoint when given a class, an associated class and an optional' do
      dummy = Dummy.find(PERSON_ONE_GRAPH)
      url = extended_class.url_builder(dummy, "Party", "current")
      expect(url).to eq "#{API_ENDPOINT}/dummies/1/parties/current.ttl"
    end
  end

end