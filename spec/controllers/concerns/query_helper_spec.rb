require 'rails_helper'

describe QueryHelper do
  let(:extended_class) { Class.new { extend QueryHelper } }

  # describe '#get_data' do
  #   it 'should get JSON data back' do
  #     uri = 'http://members-query.ukpds.org/people'
  #     expect(extended_class.get_data(uri)).to eq ""
  #   end
  # end
end