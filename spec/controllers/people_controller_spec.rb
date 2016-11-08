require 'rails_helper'

describe PeopleController do
  let(:json) { JSON.parse(response.body) }
  let(:xml) { Nokogiri::XML(response.body) }
  let(:ttl) { RDF::NTriples::Reader.new(response.body) }

  describe "GET index" do

    context 'when the requested format is JSON' do
      before(:each) do
        get 'index',format: :json
      end

      it 'returns OK response with correct format' do
        expect(response.status).to eq 200
        expect(response.content_type).to eq 'application/json'
      end

      it 'returns 2 people in the data' do
        expect(json.length).to eq 2
      end

      it 'returns the correct id for the second person' do
        expect(json[1]['id']).to eq '2'
      end
    end

    context 'when the requested format is XML' do
      before(:each) do
        get 'index',format: :xml
      end

      it 'returns OK response with correct format' do
        expect(response.status).to eq 200
        expect(response.content_type).to eq 'application/xml'
      end

      it 'returns 2 people in the data' do
        expect(xml.xpath('//person').count).to eq 2
      end

      xit 'returns the correct id for the person' do
        expect(xml.xpath('//person')[1].children.children[0].content).to eq '2'
      end
    end

    context 'when the requested format is TTL' do
      before(:each) do
        get 'index', format: :ttl
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
      render_views

      before(:each) do
        get 'index', format: :html
      end

      it 'returns OK response with correct format' do
        expect(response.status).to eq 200
        expect(response.content_type).to eq 'text/html'
      end

      it 'returns the correct data for the first person' do
        expect(response.body).to match(/<a href="\/people\/1">Daenerys<\/a>/)
      end

      it 'returns the correct json_ld in the response body' do
        expect(response.body).to match(/"@id":"http:\/\/id.ukpds.org\/1"/)
        expect(response.body).to match(/"http:\/\/id.ukpds.org\/schema\/dateOfBirth":{"@value":"1947-06-29","@type":"http:\/\/www.w3.org\/2001\/XMLSchema#date"}/)
        expect(response.body).to match(/"http:\/\/id.ukpds.org\/schema\/forename":"Daenerys"/)
        expect(response.body).to match(/"http:\/\/id.ukpds.org\/schema\/middleName":"Khaleesi"/)
        expect(response.body).to match(/"http:\/\/id.ukpds.org\/schema\/surname":"Targaryen"/)
      end
    end

  end

end