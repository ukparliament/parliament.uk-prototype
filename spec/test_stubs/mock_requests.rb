RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, "#{API_ENDPOINT}/people.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>"#{API_ENDPOINT_HOST}", 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => PEOPLE_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/people/1.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>"#{API_ENDPOINT_HOST}", 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => PERSON_ONE_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/people/members.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>"#{API_ENDPOINT_HOST}", 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => PEOPLE_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/people/members/current.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>"#{API_ENDPOINT_HOST}", 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => PEOPLE_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/people/t.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>"#{API_ENDPOINT_HOST}", 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => PERSON_ONE_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/people/members/t.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>"#{API_ENDPOINT_HOST}", 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => PERSON_ONE_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/people/members/current/t.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>"#{API_ENDPOINT_HOST}", 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => PERSON_ONE_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/people/1/contact_points.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>"#{API_ENDPOINT_HOST}", 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => CONTACT_POINT_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/contact_points/123.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>"#{API_ENDPOINT_HOST}", 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => CONTACT_POINT_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/contact_points.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>"#{API_ENDPOINT_HOST}", 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => TWO_CONTACT_POINTS_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/people/1/parties.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>"#{API_ENDPOINT_HOST}", 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => TWO_PARTIES_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/parties.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>"#{API_ENDPOINT_HOST}", 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => TWO_PARTIES_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/parties/81.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>"#{API_ENDPOINT_HOST}", 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => PARTY_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/people/1/parties/current.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>"#{API_ENDPOINT_HOST}", 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => PARTY_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/parties/current.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>"#{API_ENDPOINT_HOST}", 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => TWO_PARTIES_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/parties/s.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>"#{API_ENDPOINT_HOST}", 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => PARTY_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/parties/81/members.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>"#{API_ENDPOINT_HOST}", 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => PEOPLE_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/parties/81/members/current.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>"#{API_ENDPOINT_HOST}", 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => PEOPLE_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/parties/81/members/t.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'ukparliament-graph-api.herokuapp.com', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => PERSON_ONE_TTL, :headers => {})

    stub_request(:get, "#{API_ENDPOINT}/parties/81/members/current/t.ttl").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'ukparliament-graph-api.herokuapp.com', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => PERSON_ONE_TTL, :headers => {})

  end
end