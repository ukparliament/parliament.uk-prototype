require 'rails_helper'
require 'fetcher'
require 'lib/assets_stubs'

describe Fetcher do
  let(:extended_class) { Class.new { extend Fetcher } }

  describe '#get_template' do
    before(:each) do
      stub_request(:get, "#{MembersPrototype::Application.config.assets_endpoint}/components/lord_card").
          with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>"#{MembersPrototype::Application.config.assets_endpoint_host}", 'User-Agent'=>'Ruby'}).
          to_return(:status => 200, :body => LORD_CARD, :headers => {})

    end

    it 'returns the text for the correct template' do
      expect(extended_class.get_template('lord_card')).to eq LORD_CARD
    end
  end
end