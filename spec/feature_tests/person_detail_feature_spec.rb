require 'rails_helper'

xfeature 'show page' do
  context 'when visiting a person detail page' do
    before(:each) do
      stub_request(:get, "http://ukparliament-graph-api.herokuapp.com/people/1").
          with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'ukparliament-graph-api.herokuapp.com', 'User-Agent'=>'Ruby'}).
          to_return(:status => 200, :body => PERSON_ONE_TTL, :headers => {})
      visit person_path('1')
    end

    scenario 'should show the name of the person' do
      expect(page).to have_content('Daenerys Targaryen')
    end
  end
end