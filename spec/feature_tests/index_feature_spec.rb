# require 'rails_helper'
#
# feature 'index page' do
#   context 'when visiting the home page' do
#     before(:each) do
#       stub_request(:get, "http://members-query.ukpds.org/people.json").
#           with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'members-query.ukpds.org', 'User-Agent'=>'Ruby'}).
#           to_return(:status => 200, :body => PEOPLE_HASH.to_json, :headers => {})
#
#       visit people_path
#     end
#
#     scenario 'should show list of all people' do
#     end
#   end
# end