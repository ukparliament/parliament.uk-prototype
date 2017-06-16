require 'rails_helper'

RSpec.describe HousesController, vcr: true do

  describe "GET index" do
    before(:each) do
      get :index
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @houses' do
      assigns(:houses).each do |house|
        expect(house).to be_a(Grom::Node)
        expect(house.type).to eq('http://id.ukpds.org/schema/House')
      end
    end

    it 'assigns @houses in alphabetical order' do
      expect(assigns(:houses)[0].name).to eq('House of Commons')
      expect(assigns(:houses)[1].name).to eq('House of Lords')
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET lookup' do
    before(:each) do
      get :lookup, params: { source: 'mnisId', id: '1' }
    end

    it 'should have a response with http status redirect (302)' do
      expect(response).to have_http_status(302)
    end

    it 'assigns @house' do
      expect(assigns(:house)).to be_a(Grom::Node)
      expect(assigns(:house).type).to eq('http://id.ukpds.org/schema/House')
    end

    it 'redirects to houses/:id' do
      expect(response).to redirect_to(house_path('KL2k1BGP'))
    end
  end

  describe "GET show" do
    before(:each) do
      get :show, params: { house_id: 'KL2k1BGP' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @house' do
      expect(assigns(:house)).to be_a(Grom::Node)
      expect(assigns(:house).type).to eq('http://id.ukpds.org/schema/House')
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end
  end

  describe 'GET lookup_by_letters' do
    context 'it returns multiple results' do
      before(:each) do
        get :lookup_by_letters, params: { letters: 'house' }
      end

      it 'should have a response with http status redirect (302)' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to index' do
        expect(response).to redirect_to(houses_path)
      end
    end

    context 'it returns a single result' do
      before(:each) do
        get :lookup_by_letters, params: { letters: 'commons' }
      end

      it 'should have a response with http status redirect (302)' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to houses/:id' do
        expect(response).to redirect_to(house_path('cqIATgUK'))
      end
    end
  end
end
