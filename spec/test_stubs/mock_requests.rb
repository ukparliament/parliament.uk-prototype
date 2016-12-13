RSpec.configure do |config|
  config.before(:each) do

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/people.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PEOPLE_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/people.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PEOPLE_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/people/1.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PERSON_ONE_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/people/members.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PEOPLE_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/people/members/current.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PEOPLE_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/people/t.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PERSON_ONE_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/people/members/t.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PERSON_ONE_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/people/members/current/t.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PERSON_ONE_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/people/1/contact_points.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => CONTACT_POINT_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/contact_points/123.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => CONTACT_POINT_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/contact_points.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => TWO_CONTACT_POINTS_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/people/1/parties.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => TWO_PARTIES_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/parties.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => TWO_PARTIES_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/parties/81.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PARTY_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/people/1/parties/current.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PARTY_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/parties/current.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => TWO_PARTIES_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/parties/s.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PARTY_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/parties/81/members.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PEOPLE_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/parties/81/members/current.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PEOPLE_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/parties/81/members/current.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>"#{API_ENDPOINT_HOST}", 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => PEOPLE_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/parties/81/members/t.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PERSON_ONE_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/parties/81/members/current/t.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PERSON_ONE_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/constituencies.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => CONSTITUENCIES_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/constituencies/1.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => CONSTITUENCY_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/people/1/constituencies.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => CONSTITUENCIES_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/constituencies/1/members.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PEOPLE_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/constituencies/current.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => CONSTITUENCIES_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/constituencies/1/contact_point.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => CONTACT_POINT_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/constituencies/1/members/current.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PERSON_ONE_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/houses.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => HOUSES_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/houses/HouseOne.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => HOUSE_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/houses/HouseOne/members.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PEOPLE_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/houses/HouseOne/members.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'ukparliament-graph-api.herokuapp.com', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => PEOPLE_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/houses/HouseOne/members/current.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PEOPLE_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/houses/HouseOne/parties.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => TWO_PARTIES_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/houses/HouseOne/parties.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'ukparliament-graph-api.herokuapp.com', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => TWO_PARTIES_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/houses/HouseOne/parties/current.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => TWO_PARTIES_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/houses/HouseOne/parties/current.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'ukparliament-graph-api.herokuapp.com', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => TWO_PARTIES_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/houses/HouseOne/members/t.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PERSON_ONE_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/houses/HouseOne/members/t.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'ukparliament-graph-api.herokuapp.com', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => PERSON_ONE_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/houses/HouseOne/members/current/t.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => PERSON_ONE_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/houses/HouseOne/members/current/t.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'ukparliament-graph-api.herokuapp.com', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => PERSON_ONE_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/people/1/constituencies.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'ukparliament-graph-api.herokuapp.com', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => CONSTITUENCIES_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/people/1/houses.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => HOUSES_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/constituencies/w.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => CONSTITUENCY_TTL, :headers => {})

    stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/constituencies/current/w.ttl").
      with(:headers => {'Accept'=>'text/turtle, text/rdf+turtle, application/turtle, application/x-turtle, application/trig, application/x-trig, application/ld+json, application/x-ld+json, application/n-triples, text/plain;q=0.2, application/n-quads, text/x-nquads;q=0.2, */*;q=0.1', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => CONSTITUENCY_TTL, :headers => {})

  end
end
