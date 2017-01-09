require 'rails_helper'

RSpec.describe ConstituenciesController do

  describe "GET index" do
    before(:each) do
      get :index
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @constituencies' do
      assigns(:constituencies).each do |con|
        expect(con).to be_a(Constituency)
      end
    end

    it 'assigns @constituencies in alphabetical order' do
      expect(assigns(:constituencies)[0].name).to eq("Bethnal Green")
      expect(assigns(:constituencies)[1].name).to eq("Westminster")
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe "GET show" do
    before(:each) do
      get :show, params: { id: '1' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @constituency and @sittings' do
      expect(assigns(:constituency)).to be_a(Constituency)

      assigns(:sittings).each do |sitting|
        expect(sitting).to be_a(Sitting)
      end
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end
  end

  describe "GET current" do
    before(:each) do
      get :current
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @constituencies' do
      assigns(:constituencies).each do |con|
        expect(con).to be_a(Constituency)
      end
    end

    it 'assigns @constituencies in alphabetical order' do
      expect(assigns(:constituencies)[0].name).to eq("Bethnal Green")
      expect(assigns(:constituencies)[1].name).to eq("Westminster")
    end

    it 'renders the current template' do
      expect(response).to render_template('current')
    end
  end

  describe "GET map" do
    before(:each) do
      get :map, params: { constituency_id: '1' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @constituency' do
      expect(assigns(:constituency)).to be_a(Constituency)
    end

    it 'renders the map template' do
      expect(response).to render_template('map')
    end
  end

  describe "GET contact_point" do
    before(:each) do
      get :contact_point, params: { constituency_id: '1' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @constituency and @contact_point' do
      expect(assigns(:constituency)).to be_a(Constituency)
      expect(assigns(:contact_point)).to be_a(ContactPoint)
    end

    it 'renders the contact_point template' do
      expect(response).to render_template('contact_point')
    end
  end

  describe "GET members" do
    before(:each) do
      get :members, params: { constituency_id: '1' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @constituency, @sittings and @members' do
      expect(assigns(:constituency)).to be_a(Constituency)

      assigns(:sittings).each do |sitting|
        expect(sitting).to be_a(Hash)
      end

      assigns(:members).each do |member|
        expect(member).to be_a(Member)
      end
    end

    it 'renders the members template' do
      expect(response).to render_template('members')
    end
  end

  describe "GET current_member" do
    before(:each) do
      get :current_member, params: { constituency_id: '1' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @constituency and @member' do
      expect(assigns(:constituency)).to be_a(Constituency)
      expect(assigns(:member)).to be_a(Member)
    end

    it 'renders the current_member template' do
      expect(response).to render_template('current_member')
    end
  end

  describe "GET letters" do
    before(:each) do
      get :letters, params: { letter: 'w' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @constituencies' do
      assigns(:constituencies).each do |con|
        expect(con).to be_a(Constituency)
      end
    end

    it 'assigns @constituencies in alphabetical order' do
      expect(assigns(:constituencies)[0].name).to eq("Westminster")
    end

    it 'renders the index template' do
      expect(response).to render_template('letters')
    end
  end

  describe "GET current_letters" do
    before(:each) do
      get :current_letters, params: { letter: 'w' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @constituencies' do
      assigns(:constituencies).each do |con|
        expect(con).to be_a(Constituency)
      end
    end

    it 'assigns @constituencies in alphabetical order' do
      expect(assigns(:constituencies)[0].name).to eq("Westminster")
    end

    it 'renders the index template' do
      expect(response).to render_template('current_letters')
    end
  end
end
