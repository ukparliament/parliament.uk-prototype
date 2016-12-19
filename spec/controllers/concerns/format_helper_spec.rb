require 'rails_helper'

RSpec.describe FormatHelper, :type => :request  do
  let(:json) { JSON.parse(response.body) }
  let(:xml) { Nokogiri::XML(response.body) }
  let(:ttl) { RDF::NTriples::Reader.new(response.body) }

  describe '#format' do
    context 'when the requested format is JSON' do
      before(:each) do
        get '/people.json'
      end

      it 'returns OK response with correct format' do
        expect(response.status).to eq 200
        expect(response.content_type).to eq 'application/json'
      end

      it 'returns 2 people in the data' do
        expect(json.length).to eq 2
      end

      it 'returns the correct forename and surname for the person whose id is 2' do
        arya_hash = json.select{ |hash| hash['id'] == '2' }[0]
        expect(arya_hash['forename']).to eq 'Arya'
        expect(arya_hash['surname']).to eq 'Stark'
      end
    end

    context 'when the requested format is JSON for an object containing nested resources' do
      before(:each) do
        get '/people/members/current/a-z/a.json'
      end

      it 'returns OK response with correct format' do
        expect(response.status).to eq 200
        expect(response.content_type).to eq 'application/json'
      end

      it 'returns the correct forename and surname, as well as information about house, party and constituency' do
        json_hash = json.first
        expect(json_hash['forename']).to eq 'Arya'
        expect(json_hash['surname']).to eq 'Stark'
        expect(json_hash['house']['id']).to eq 'HouseOne'
        expect(json_hash['party']['id']).to eq '3'
        expect(json_hash['party']['name']).to eq 'PartyOne'
        expect(json_hash['constituency']['id']).to eq '2'
        expect(json_hash['constituency']['name']).to eq 'ConstituencyOne'
      end
    end

    context 'when the requested format is XML' do
      before(:each) do
        get '/people.xml'
      end

      it 'returns OK response with correct format' do
        expect(response.status).to eq 200
        expect(response.content_type).to eq 'application/xml'
      end

      it 'returns 2 people objects in the data' do
        expect(xml.xpath('//object').count).to eq 2
      end

      it 'returns the correct forename and surname for the person whose id is 2' do
        arya_node = xml.xpath('//object').select { |o| o.children.children[0].content == '2' }.first
        expect(arya_node.xpath('forename').children[0].content).to eq 'Arya'
        expect(arya_node.xpath('surname').children[0].content).to eq 'Stark'
      end
    end

    context 'when the requested format is XML for an object containing nested resources' do
      before(:each) do
        get '/people/members/current/a-z/a.xml'
      end

      it 'returns OK response with correct format' do
        expect(response.status).to eq 200
        expect(response.content_type).to eq 'application/xml'
      end

      it 'returns the correct forename and surname, as well as information about house, party and constituency' do
        xml_node = xml.xpath('//object')
        expect(xml_node.xpath('forename').children[0].content).to eq 'Arya'
        expect(xml_node.xpath('surname').children[0].content).to eq 'Stark'
        expect(xml_node.xpath('house').xpath('id').children[0].content).to eq 'HouseOne'
        expect(xml_node.xpath('party').xpath('id').children[0].content).to eq '3'
        expect(xml_node.xpath('party').xpath('name').children[0].content).to eq 'PartyOne'
        expect(xml_node.xpath('constituency').xpath('id').children[0].content).to eq '2'
        expect(xml_node.xpath('constituency').xpath('name').children[0].content).to eq 'ConstituencyOne'
      end
    end

    xcontext 'when the requested format is TTL' do
      before(:each) do
        get '/people.ttl'
      end

      it 'returns OK response with correct format' do
        expect(response.status).to eq 200
        expect(response.content_type).to eq 'text/turtle'
      end

      it 'returns 8 statements in the data' do
        expect(ttl.count).to eq 8
      end

      it 'returns the correct data for the first person' do
        expect(ttl.first).to eq PEOPLE_GRAPH.first
      end
    end

    context 'when the requested format is HTML' do
      before(:each) do
        get '/people'
      end

      it 'returns OK response with correct format' do
        expect(response.status).to eq 200
        expect(response.content_type).to eq 'text/html'
      end

      it 'returns the correct data for the first person' do
        expect(response.body).to match(/<a href="\/people\/1">Daenerys Targaryen<\/a>/)
      end

      xit 'returns the correct json_ld in the response body' do
        expect(response.body).to match(/"@id":"http:\/\/id.ukpds.org\/1"/)
        expect(response.body).to match(/"http:\/\/id.ukpds.org\/schema\/dateOfBirth":{"@value":"1947-06-29","@type":"http:\/\/www.w3.org\/2001\/XMLSchema#date"}/)
        expect(response.body).to match(/"http:\/\/id.ukpds.org\/schema\/forename":"Daenerys"/)
        expect(response.body).to match(/"http:\/\/id.ukpds.org\/schema\/middleName":"Khaleesi"/)
        expect(response.body).to match(/"http:\/\/id.ukpds.org\/schema\/surname":"Targaryen"/)
      end
    end
  end
end
