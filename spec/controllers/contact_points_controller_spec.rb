require 'rails_helper'

RSpec.describe ContactPointsController do

  describe "GET index" do
    before(:each) do
      get :index
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @contact_points' do
      assigns(:contact_points).each do |cp|
        expect(cp).to be_a(ContactPoint)
      end
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe "GET show" do
    before(:each) do
      get :show, params: { id: '123' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @contact_point' do
      expect(assigns(:contact_point)).to be_a(ContactPoint)
    end
  end
end