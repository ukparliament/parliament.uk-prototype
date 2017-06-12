require 'rails_helper'

RSpec.describe Parliaments::HousesController, vcr: true do

  describe 'GET index' do
    before(:each) do
      get :index, params: { parliament_id: '0FxbTVtr' }
    end

    it 'should have a response with http status ok (200)'do
      expect(response).to have_http_status(:ok)
    end

    context '@parliament' do
      it 'assigns @parliament' do
        expect(assigns(:parliament)).to be_a(Grom::Node)
        expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
      end
    end

    context '@house' do
      it 'assigns @houses' do
        assigns(:houses).each do |house|
          expect(house).to be_a(Grom::Node)
          expect(house.type).to eq('http://id.ukpds.org/schema/House')
        end
      end
    end

    it 'renders the houses template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    context '@house is nil' do
      # updated VCR cassette in order to set @house to nil
      it 'should raise ActionController::RoutingError' do
        expect{get :show, params: { parliament_id: '0FxbTVtr', house_id: 'cqIATgUK' }}.to raise_error(ActionController::RoutingError)
      end
    end

    context '@house is not nil' do
      before(:each) do
        get :show, params: { parliament_id: '0FxbTVtr', house_id: 'cqIATgUK' }
      end

      context '@parliament' do
        it 'assigns @parliament' do
          expect(assigns(:parliament)).to be_a(Grom::Node)
          expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
        end
      end

      context '@house' do
        it 'assigns @house' do
          expect(assigns(:house)).to be_a(Grom::Node)
          expect(assigns(:house).type).to eq('http://id.ukpds.org/schema/House')
        end
      end

      it 'renders the house template' do
        expect(response).to render_template('show')
      end
    end
  end
end
