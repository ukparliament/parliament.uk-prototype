require 'rails_helper'

RSpec.describe ApplicationController do

  describe 'GET a_to_z' do
    before(:each) do
      get :a_to_z
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assings @root_path' do
      expect(assigns(:root_path)).to eq(request.path)
    end

    it 'renders the a_to_z template' do
      expect(response).to render_template('a_to_z')
    end
  end
end