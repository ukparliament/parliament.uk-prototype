require 'rails_helper'

RSpec.describe Constituencies::ContactPointsController, vcr: true do

  describe 'GET index' do
    before(:each) do
      get :index, params: { constituency_id: 'MtbjxRrE' }
    end

    it 'should have a response with a http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @constituency' do
      expect(assigns(:constituency)).to be_a(Grom::Node)
      expect(assigns(:constituency).type).to eq('http://id.ukpds.org/schema/ConstituencyGroup')
    end

    it 'renders the contact_point template' do
      expect(response).to render_template('index')
    end
  end

end
