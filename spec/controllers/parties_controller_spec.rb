require 'rails_helper'

RSpec.describe PartiesController do

  describe "GET index" do
    before(:each) do
      get :index
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @parties' do
      assigns(:parties).each do |party|
        expect(party).to be_a(Party)
      end
    end

    it 'assigns @parties in alphabetical order' do
      expect(assigns(:parties)[0].name).to eq("Starks")
      expect(assigns(:parties)[1].name).to eq("Targaryens")
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe "GET current" do
    before(:each) do
      get :current
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @parties' do
      assigns(:parties).each do |party|
        expect(party).to be_a(Party)
      end
    end

    it 'assigns @parties in alphabetical order' do
      expect(assigns(:parties)[0].name).to eq("Starks")
      expect(assigns(:parties)[1].name).to eq("Targaryens")
    end

    it 'renders the current template' do
      expect(response).to render_template('current')
    end
  end

  describe "GET show" do
    before(:each) do
      get :show, params: { id: '81' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @party' do
      expect(assigns(:party)).to be_a(Party)
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end
  end

  describe "GET members" do
    before(:each) do
      get :members, params: { party_id: "81" }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @party and @members' do
      expect(assigns(:party)).to be_a(Party)

      assigns(:members).each do |member|
        expect(member).to be_a(Member)
      end
    end

    it 'assigns @members in alphabetical order' do
      expect(assigns(:members)[0].forename).to eq("Arya")
      expect(assigns(:members)[1].forename).to eq("Daenerys")
    end

    it 'renders the members template' do
      expect(response).to render_template('members')
    end
  end

  describe "GET current_members" do
    before(:each) do
      get :current_members, params: { party_id: "81" }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @party and @members' do
      expect(assigns(:party)).to be_a(Party)

      assigns(:members).each do |member|
        expect(member).to be_a(Member)
      end
    end

    it 'assigns @members in alphabetical order' do
      expect(assigns(:members)[0].forename).to eq("Arya")
      expect(assigns(:members)[1].forename).to eq("Daenerys")
    end

    it 'renders the members template' do
      expect(response).to render_template('members')
    end
  end

  describe "GET letters" do
    before(:each) do
      get :letters, params: { letter: "s" }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @parties' do
      assigns(:parties).each do |party|
        expect(party).to be_a(Party)
      end
    end

    it 'assigns @parties in alphabetical order' do
      expect(assigns(:parties)[0].name).to eq("Starks")
    end

    it 'renders the index template' do
      expect(response).to render_template('letters')
    end
  end

  describe "GET members_letters" do
    before(:each) do
      get :members_letters, params: { party_id: 81, letter: "t" }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @party and @members' do
      expect(assigns(:party)).to be_a(Party)

      assigns(:members).each do |member|
        expect(member).to be_a(Member)
      end
    end

    it 'assigns @members in alphabetical order' do
      expect(assigns(:members)[0].forename).to eq("Daenerys")
    end

    it 'renders the members template' do
      expect(response).to render_template('members_letters')
    end
  end

  describe "GET current_members_letters" do
    before(:each) do
      get :current_members_letters, params: { party_id: 81, letter: "t" }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @party and @members' do
      expect(assigns(:party)).to be_a(Party)

      assigns(:members).each do |member|
        expect(member).to be_a(Member)
      end
    end

    it 'assigns @members in alphabetical order' do
      expect(assigns(:members)[0].forename).to eq("Daenerys")
    end

    it 'renders the members template' do
      expect(response).to render_template('current_members_letters')
    end
  end
end
