# require 'rails_helper'
#
# describe QueryHelper do
#   let(:extended_class) { Class.new { extend QueryHelper } }
#
#   describe '#get_data' do
#     before(:each) do
#       stub_request(:get, "http://members-query.ukpds.org/people.json").
#           with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'members-query.ukpds.org', 'User-Agent'=>'Ruby'}).
#           to_return(:status => 200, :body => "", :headers => {})
#     end
#
#     it 'should get JSON data when the format request is JSON' do
#       uri = 'http://members-query.ukpds.org/people'
#       expect(extended_class.get_data(uri)).to eq ""
#     end
#   end
# end