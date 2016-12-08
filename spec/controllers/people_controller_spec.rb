require 'rails_helper'
require 'json'

RSpec.describe PeopleController do
  let(:json) { JSON.parse(response.body) }
  let(:xml) { Nokogiri::XML(response.body) }
  let(:ttl) { RDF::NTriples::Reader.new(response.body) }

  describe "GET index" do
    it 'the response should have http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @people' do
      get :index
      expect(assigns(:people)[0]).to be_a(Person)
    end

    it 'assigns @people in name order' do
      get :index
      expect(assigns(:people)[0].forename).to eq("Arya")
      expect(assigns(:people)[1].forename).to eq("Daenerys")
    end

    it 'renders the show template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  xdescribe "GET show" do
    it 'assigns @peron' do
      get :show, params: { id: '1' }
      expect(assigns(:person)).to be_a(Person)
    end

    it 'renders the index template' do
      get :show, params: { id: '1' }
      expect(response).to render_template('show')
    end
  end

  describe "GET members" do
    it 'assigns @people' do
      get :members
      expect(assigns(:people)[0]).to be_a(Person)
    end

    it 'assigns @people in name order' do
      get :members
      expect(assigns(:people)[0].forename).to eq("Arya")
      expect(assigns(:people)[1].forename).to eq("Daenerys")
    end

    it 'renders the members template' do
      get :members
      expect(response).to render_template('members')
    end
  end

  describe "GET current_members" do
    it 'assigns @people' do
      get :current_members
      expect(assigns(:people)[0]).to be_a(Person)
    end

    it 'assigns @people in name order' do
      get :current_members
      expect(assigns(:people)[0].forename).to eq("Arya")
      expect(assigns(:people)[1].forename).to eq("Daenerys")
    end

    it 'renders the members template' do
      get :current_members
      expect(response).to render_template('current_members')
    end
  end

  describe "GET letters" do
    it 'assigns @people' do
      get :letters, params: { letter: "t" }
      expect(assigns(:people)[0]).to be_a(Person)
    end

    it 'assigns @people in name order' do
      get :letters, params: { letter: "t" }
      expect(assigns(:people)[0].forename).to eq("Daenerys")
    end

    it 'renders the members template' do
      get :letters, params: { letter: "t" }
      expect(response).to render_template('index')
    end
  end

  describe "GET members_letters" do
    it 'assigns @people' do
      get :members_letters, params: { letter: "t" }
      expect(assigns(:people)[0]).to be_a(Person)
    end

    it 'assigns @people in name order' do
      get :members_letters, params: { letter: "t" }
      expect(assigns(:people)[0].forename).to eq("Daenerys")
    end

    it 'renders the members template' do
      get :members_letters, params: { letter: "t" }
      expect(response).to render_template('members')
    end
  end

  describe "GET current_members_letters" do
    it 'assigns @people' do
      get :current_members_letters, params: { letter: "t" }
      expect(assigns(:people)[0]).to be_a(Person)
    end

    it 'assigns @people in name order' do
      get :current_members_letters, params: { letter: "t" }
      expect(assigns(:people)[0].forename).to eq("Daenerys")
    end

    it 'renders the members template' do
      get :current_members_letters, params: { letter: "t" }
      expect(response).to render_template('members')
    end
  end
end

