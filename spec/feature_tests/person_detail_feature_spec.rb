require 'rails_helper'

feature 'show page' do
  context 'when visiting a person detail page' do
    before(:each) do
      # stub_request(:get, "http://members-query.ukpds.org/people/1.json").
      #     with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'members-query.ukpds.org', 'User-Agent'=>'Ruby'}).
      #     to_return(:status => 200, :body => PERSON_ONE_HASH.to_json, :headers => {})
      #
      # stub_request(:get, "http://members-query.ukpds.org/people/1.ttl").
      #     with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'members-query.ukpds.org', 'User-Agent'=>'Ruby'}).
      #     to_return(:status => 200, :body => "", :headers => {})

      allow_any_instance_of(PeopleController).to receive(:get_data).and_return({ graph: PERSON_ONE_TTL, json: PERSON_ONE_HASH.to_json })

      visit person_path('1')
    end

    scenario 'should show the name of the person' do
      expect(page).to have_content('Member1')
    end
  end
end